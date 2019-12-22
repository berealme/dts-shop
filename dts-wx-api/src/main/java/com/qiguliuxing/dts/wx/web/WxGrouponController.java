package com.qiguliuxing.dts.wx.web;

import static com.qiguliuxing.dts.wx.util.WxResponseCode.GOODS_UNKNOWN;
import static com.qiguliuxing.dts.wx.util.WxResponseCode.ORDER_INVALID;
import static com.qiguliuxing.dts.wx.util.WxResponseCode.ORDER_UNKNOWN;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.qiguliuxing.dts.core.express.ExpressService;
import com.qiguliuxing.dts.core.express.dao.ExpressInfo;
import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.core.validator.Order;
import com.qiguliuxing.dts.core.validator.Sort;
import com.qiguliuxing.dts.db.domain.DtsGoods;
import com.qiguliuxing.dts.db.domain.DtsGroupon;
import com.qiguliuxing.dts.db.domain.DtsGrouponRules;
import com.qiguliuxing.dts.db.domain.DtsOrder;
import com.qiguliuxing.dts.db.domain.DtsOrderGoods;
import com.qiguliuxing.dts.db.domain.DtsUser;
import com.qiguliuxing.dts.db.domain.UserVo;
import com.qiguliuxing.dts.db.service.DtsGoodsService;
import com.qiguliuxing.dts.db.service.DtsGrouponRulesService;
import com.qiguliuxing.dts.db.service.DtsGrouponService;
import com.qiguliuxing.dts.db.service.DtsOrderGoodsService;
import com.qiguliuxing.dts.db.service.DtsOrderService;
import com.qiguliuxing.dts.db.service.DtsUserService;
import com.qiguliuxing.dts.db.util.OrderUtil;
import com.qiguliuxing.dts.wx.annotation.LoginUser;

/**
 * 团购服务
 * <p>
 * 需要注意这里团购规则和团购活动的关系和区别。
 */
@RestController
@RequestMapping("/wx/groupon")
@Validated
public class WxGrouponController {

    @Autowired
    private DtsGrouponRulesService rulesService;
    @Autowired
    private DtsGrouponService grouponService;
    @Autowired
    private DtsGoodsService goodsService;
    @Autowired
    private DtsOrderService orderService;
    @Autowired
    private DtsOrderGoodsService orderGoodsService;
    @Autowired
    private DtsUserService userService;
    @Autowired
    private ExpressService expressService;
    @Autowired
    private DtsGrouponRulesService grouponRulesService;

    /**
     * 团购规则列表
     *
     * @param page 分页页数
     * @param size 分页大小
     * @return 团购规则列表
     */
    @GetMapping("list")
    public Object list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer size,
                       @Sort @RequestParam(defaultValue = "add_time") String sort,
                       @Order @RequestParam(defaultValue = "desc") String order) {
        List<Map<String, Object>> topicList = grouponRulesService.queryList(page, size, sort, order);
        long total = PageInfo.of(topicList).getTotal();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("data", topicList);
        data.put("count", total);
        return ResponseUtil.ok(data);
    }

    /**
     * 团购活动详情
     *
     * @param userId    用户ID
     * @param grouponId 团购活动ID
     * @return 团购活动详情
     */
    @GetMapping("detail")
    public Object detail(@LoginUser Integer userId, @NotNull Integer grouponId) {
        if (userId == null) {
            return ResponseUtil.unlogin();
        }

        DtsGroupon groupon = grouponService.queryById(grouponId);
        if (groupon == null) {
            return ResponseUtil.badArgumentValue();
        }

        DtsGrouponRules rules = rulesService.queryById(groupon.getRulesId());
        if (rules == null) {
            return ResponseUtil.badArgumentValue();
        }

        // 订单信息
        DtsOrder order = orderService.findById(groupon.getOrderId());
        if (null == order) {
            return ResponseUtil.fail(ORDER_UNKNOWN, "订单不存在");
        }
        if (!order.getUserId().equals(userId)) {
            return ResponseUtil.fail(ORDER_INVALID, "不是当前用户的订单");
        }
        Map<String, Object> orderVo = new HashMap<String, Object>();
        orderVo.put("id", order.getId());
        orderVo.put("orderSn", order.getOrderSn());
        orderVo.put("addTime", order.getAddTime());
        orderVo.put("consignee", order.getConsignee());
        orderVo.put("mobile", order.getMobile());
        orderVo.put("address", order.getAddress());
        orderVo.put("goodsPrice", order.getGoodsPrice());
        orderVo.put("freightPrice", order.getFreightPrice());
        orderVo.put("actualPrice", order.getActualPrice());
        orderVo.put("orderStatusText", OrderUtil.orderStatusText(order));
        orderVo.put("handleOption", OrderUtil.build(order));
        orderVo.put("expCode", order.getShipChannel());
        orderVo.put("expNo", order.getShipSn());

        List<DtsOrderGoods> orderGoodsList = orderGoodsService.queryByOid(order.getId());
        List<Map<String, Object>> orderGoodsVoList = new ArrayList<>(orderGoodsList.size());
        for (DtsOrderGoods orderGoods : orderGoodsList) {
            Map<String, Object> orderGoodsVo = new HashMap<>();
            orderGoodsVo.put("id", orderGoods.getId());
            orderGoodsVo.put("orderId", orderGoods.getOrderId());
            orderGoodsVo.put("goodsId", orderGoods.getGoodsId());
            orderGoodsVo.put("goodsName", orderGoods.getGoodsName());
            orderGoodsVo.put("number", orderGoods.getNumber());
            orderGoodsVo.put("retailPrice", orderGoods.getPrice());
            orderGoodsVo.put("picUrl", orderGoods.getPicUrl());
            orderGoodsVo.put("goodsSpecificationValues", orderGoods.getSpecifications());
            orderGoodsVoList.add(orderGoodsVo);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("orderInfo", orderVo);
        result.put("orderGoods", orderGoodsVoList);

        // 订单状态为已发货且物流信息不为空
        //"YTO", "800669400640887922"
		/*
		 * if (order.getOrderStatus().equals(OrderUtil.STATUS_SHIP)) { ExpressInfo ei =
		 * expressService.getExpressInfo(order.getShipChannel(), order.getShipSn());
		 * result.put("expressInfo", ei); }
		 */

        UserVo creator = userService.findUserVoById(groupon.getCreatorUserId());
        List<UserVo> joiners = new ArrayList<>();
        joiners.add(creator);
        int linkGrouponId;
        // 这是一个团购发起记录
        if (groupon.getGrouponId() == 0) {
            linkGrouponId = groupon.getId();
        } else {
            linkGrouponId = groupon.getGrouponId();

        }
        List<DtsGroupon> groupons = grouponService.queryJoinRecord(linkGrouponId);

        UserVo joiner;
        for (DtsGroupon grouponItem : groupons) {
            joiner = userService.findUserVoById(grouponItem.getUserId());
            joiners.add(joiner);
        }

        result.put("linkGrouponId", linkGrouponId);
        result.put("creator", creator);
        result.put("joiners", joiners);
        result.put("groupon", groupon);
        result.put("rules", rules);
        return ResponseUtil.ok(result);
    }

    /**
     * 参加团购
     *
     * @param grouponId 团购活动ID
     * @return 操作结果
     */
    @GetMapping("join")
    public Object join(@NotNull Integer grouponId) {
        DtsGroupon groupon = grouponService.queryById(grouponId);
        if (groupon == null) {
            return ResponseUtil.badArgumentValue();
        }

        DtsGrouponRules rules = rulesService.queryById(groupon.getRulesId());
        if (rules == null) {
            return ResponseUtil.badArgumentValue();
        }

        DtsGoods goods = goodsService.findById(rules.getGoodsId());
        if (goods == null) {
            return ResponseUtil.badArgumentValue();
        }

        Map<String, Object> result = new HashMap<>();
        result.put("groupon", groupon);
        result.put("goods", goods);

        return ResponseUtil.ok(result);
    }

    /**
     * 用户开团或入团情况
     *
     * @param userId 用户ID
     * @param showType 显示类型，如果是0，则是当前用户开的团购；否则，则是当前用户参加的团购
     * @return 用户开团或入团情况
     */
    @GetMapping("my")
    public Object my(@LoginUser Integer userId, @RequestParam(defaultValue = "0") Integer showType) {
        if (userId == null) {
            return ResponseUtil.unlogin();
        }

        List<DtsGroupon> myGroupons;
        if (showType == 0) {
            myGroupons = grouponService.queryMyGroupon(userId);
        } else {
            myGroupons = grouponService.queryMyJoinGroupon(userId);
        }

        List<Map<String, Object>> grouponVoList = new ArrayList<>(myGroupons.size());

        DtsOrder order;
        DtsGrouponRules rules;
        DtsUser creator;
        for (DtsGroupon groupon : myGroupons) {
            order = orderService.findById(groupon.getOrderId());
            rules = rulesService.queryById(groupon.getRulesId());
            creator = userService.findById(groupon.getCreatorUserId());

            Map<String, Object> grouponVo = new HashMap<>();
            //填充团购信息
            grouponVo.put("id", groupon.getId());
            grouponVo.put("groupon", groupon);
            grouponVo.put("rules", rules);
            grouponVo.put("creator", creator.getNickname());

            int linkGrouponId;
            // 这是一个团购发起记录
            if (groupon.getGrouponId() == 0) {
                linkGrouponId = groupon.getId();
                grouponVo.put("isCreator", creator.getId() == userId);
            } else {
                linkGrouponId = groupon.getGrouponId();
                grouponVo.put("isCreator", false);
            }
            int joinerCount = grouponService.countGroupon(linkGrouponId);
            grouponVo.put("joinerCount", joinerCount + 1);

            //填充订单信息
            grouponVo.put("orderId", order.getId());
            grouponVo.put("orderSn", order.getOrderSn());
            grouponVo.put("actualPrice", order.getActualPrice());
            grouponVo.put("orderStatusText", OrderUtil.orderStatusText(order));
            grouponVo.put("handleOption", OrderUtil.build(order));

            List<DtsOrderGoods> orderGoodsList = orderGoodsService.queryByOid(order.getId());
            List<Map<String, Object>> orderGoodsVoList = new ArrayList<>(orderGoodsList.size());
            for (DtsOrderGoods orderGoods : orderGoodsList) {
                Map<String, Object> orderGoodsVo = new HashMap<>();
                orderGoodsVo.put("id", orderGoods.getId());
                orderGoodsVo.put("goodsName", orderGoods.getGoodsName());
                orderGoodsVo.put("number", orderGoods.getNumber());
                orderGoodsVo.put("picUrl", orderGoods.getPicUrl());
                orderGoodsVoList.add(orderGoodsVo);
            }
            grouponVo.put("goodsList", orderGoodsVoList);
            grouponVoList.add(grouponVo);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("count", grouponVoList.size());
        result.put("data", grouponVoList);

        return ResponseUtil.ok(result);
    }

    /**
     * 商品所对应的团购规则
     *
     * @param goodsId 商品ID
     * @return 团购规则详情
     */
    @GetMapping("query")
    public Object query(@NotNull Integer goodsId) {
        DtsGoods goods = goodsService.findById(goodsId);
        if (goods == null) {
            return ResponseUtil.fail(GOODS_UNKNOWN, "未找到对应的商品");
        }

        List<DtsGrouponRules> rules = rulesService.queryByGoodsId(goodsId);

        return ResponseUtil.ok(rules);
    }
}
