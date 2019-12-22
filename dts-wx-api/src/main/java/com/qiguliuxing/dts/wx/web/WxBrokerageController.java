package com.qiguliuxing.dts.wx.web;

import static com.qiguliuxing.dts.wx.util.WxResponseCode.AUTH_CAPTCHA_UNMATCH;
import static com.qiguliuxing.dts.wx.util.WxResponseCode.APPLY_WITHDRAWAL_FAIL;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qiguliuxing.dts.core.util.DateTimeUtil;
import com.qiguliuxing.dts.core.util.JacksonUtil;
import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.db.domain.DtsUserAccount;
import com.qiguliuxing.dts.db.service.DtsAccountService;
import com.qiguliuxing.dts.wx.annotation.LoginUser;
import com.qiguliuxing.dts.wx.service.CaptchaCodeManager;
import com.qiguliuxing.dts.wx.service.WxOrderService;

/**
 * 佣金业务接口
 * @author CHENBO
 *
 */
@RestController
@RequestMapping("/wx/brokerage")
@Validated
public class WxBrokerageController {
	
	@Autowired
	private DtsAccountService accountService;
	
	@Autowired
	private WxOrderService wxOrderService;
	
	/**
     * 用户结算页面数据
     * <p>
     * 目前是用户结算统计信息
     *
     * @param userId 用户ID
     * @return 用户个人页面数据
     */
    @GetMapping("main")
    public Object main(@LoginUser Integer userId) {
        if (userId == null) {
            return ResponseUtil.unlogin();
        }

        Map<Object, Object> data = new HashMap<Object, Object>();
       
        //查询用户账号
        DtsUserAccount userAccount = accountService.findShareUserAccountByUserId(userId);
        BigDecimal totalAmount = new BigDecimal(0.00);
        BigDecimal remainAmount = new BigDecimal(0.00);
        if(userAccount != null) {
        	totalAmount = userAccount.getTotalAmount();
        	remainAmount = userAccount.getRemainAmount();
        }
        data.put("totalAmount",totalAmount);
        data.put("remainAmount",remainAmount);
        
        //统计数据信息 本月和上月的结算
        String lastMonthEndTime = DateTimeUtil.getPrevMonthEndDay() + " 23:59:59";
		String lastMonthStartTime = DateTimeUtil.getPrevMonthEndDay().substring(0, 7) + "-01 00:00:00";
        BigDecimal lastMonthSettleMoney = accountService.getMonthSettleMoney(userId,lastMonthStartTime,lastMonthEndTime);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(new Date());
        String currMonthEndTime = today + " 23:59:59";
		String currMonthStartTime = today.substring(0, 7) + "-01 00:00:00";
		BigDecimal currMonthSettleMoney = accountService.getMonthSettleMoney(userId,currMonthStartTime,currMonthEndTime);
		data.put("lastMonthSettleMoney",lastMonthSettleMoney);
        data.put("currMonthSettleMoney",currMonthSettleMoney);
        
        Map<String, Object> todayData = accountService.getStatistics(userId,1);
        Map<String, Object> yestodayData = accountService.getStatistics(userId,2);
        Map<String, Object> weekData = accountService.getStatistics(userId,7);
        Map<String, Object> monthData = accountService.getStatistics(userId,30);
        
        data.put("todayData",todayData);
        data.put("yestodayData",yestodayData);
        data.put("weekData",weekData);
        data.put("monthData",monthData);
        
        return ResponseUtil.ok(data);
    }
    
    
    /**
     * 推广订单列表
     *
     * @param userId   用户代理用户ID
     * @param showType 订单信息：
     *                 0，全部订单；
     *                 1，有效订单；
     *                 2，失效订单；
     *                 3，结算订单；
     *                 4，待结算订单。
     * @param page     分页页数
     * @param size     分页大小
     * @return 推广订单列表
     */
    @GetMapping("settleOrderList")
    public Object settleOrderList(@LoginUser Integer userId,
                       @RequestParam(defaultValue = "0") Integer showType,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer size) {
        return wxOrderService.settleOrderList(userId, showType, page, size);
    }
    
    
    @GetMapping("extractList")
    public Object extractList(@LoginUser Integer userId,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer size) {
        return wxOrderService.extractList(userId, page, size);
    }
    
    /**
          * 提现申请
     * @param userId
     * @param page
     * @param size
     * @return
     */
    @GetMapping("applyWithdrawal")
    public Object applyWithdrawal(@LoginUser Integer userId,@RequestBody String body) {
    	if (userId == null) {
            return ResponseUtil.unlogin();
        }
        String mobile = JacksonUtil.parseString(body, "mobile");
        String code = JacksonUtil.parseString(body, "code");
        String amt = JacksonUtil.parseString(body, "amt");
        
        if (StringUtils.isEmpty(amt) || StringUtils.isEmpty(mobile) || StringUtils.isEmpty(code)) {
            return ResponseUtil.badArgument();
        }
        
        //判断验证码是否正确
        String cacheCode = CaptchaCodeManager.getCachedCaptcha(mobile);
        if (cacheCode == null || cacheCode.isEmpty() || !cacheCode.equals(code)) {
            return ResponseUtil.fail(AUTH_CAPTCHA_UNMATCH, "验证码错误");
        }
        
        //判断用户可提现金额正确性
        DtsUserAccount userAccount = accountService.findShareUserAccountByUserId(userId);
        BigDecimal remainAmount = new BigDecimal(0.00);
        BigDecimal applyAmt= new BigDecimal(amt);
        if(userAccount != null) {
        	remainAmount = userAccount.getRemainAmount();
        }
        if (remainAmount.compareTo(applyAmt) == -1) {
        	return ResponseUtil.fail(APPLY_WITHDRAWAL_FAIL, "申请提现金额不能大于可提现金额");
        }
        
        //生成提现申请记录到账户跟踪表
        accountService.addExtractRecord(userId,applyAmt,mobile,code,remainAmount);

        return ResponseUtil.ok();
    }
}
