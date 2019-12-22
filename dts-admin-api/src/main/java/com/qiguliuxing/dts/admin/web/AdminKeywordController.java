package com.qiguliuxing.dts.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.qiguliuxing.dts.admin.annotation.RequiresPermissionsDesc;
import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.core.validator.Order;
import com.qiguliuxing.dts.core.validator.Sort;
import com.qiguliuxing.dts.db.domain.DtsKeyword;
import com.qiguliuxing.dts.db.service.DtsKeywordService;

@RestController
@RequestMapping("/admin/keyword")
@Validated
public class AdminKeywordController {

    @Autowired
    private DtsKeywordService keywordService;

    @RequiresPermissions("admin:keyword:list")
    @RequiresPermissionsDesc(menu={"商场管理" , "关键词"}, button="查询")
    @GetMapping("/list")
    public Object list(String keyword, String url,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer limit,
                       @Sort @RequestParam(defaultValue = "add_time") String sort,
                       @Order @RequestParam(defaultValue = "desc") String order) {
        List<DtsKeyword> brandList = keywordService.querySelective(keyword, url, page, limit, sort, order);
        long total = PageInfo.of(brandList).getTotal();
        Map<String, Object> data = new HashMap<>();
        data.put("total", total);
        data.put("items", brandList);

        return ResponseUtil.ok(data);
    }

    private Object validate(DtsKeyword keywords) {
        String keyword = keywords.getKeyword();
        if (StringUtils.isEmpty(keyword)) {
            return ResponseUtil.badArgument();
        }
        String url = keywords.getUrl();
        if (StringUtils.isEmpty(url)) {
            return ResponseUtil.badArgument();
        }
        return null;
    }

    @RequiresPermissions("admin:keyword:create")
    @RequiresPermissionsDesc(menu={"商场管理" , "关键词"}, button="添加")
    @PostMapping("/create")
    public Object create(@RequestBody DtsKeyword keywords) {
        Object error = validate(keywords);
        if (error != null) {
            return error;
        }
        keywordService.add(keywords);
        return ResponseUtil.ok(keywords);
    }

    @RequiresPermissions("admin:keyword:read")
    @RequiresPermissionsDesc(menu={"商场管理" , "关键词"}, button="详情")
    @GetMapping("/read")
    public Object read(@NotNull Integer id) {
        DtsKeyword brand = keywordService.findById(id);
        return ResponseUtil.ok(brand);
    }

    @RequiresPermissions("admin:keyword:update")
    @RequiresPermissionsDesc(menu={"商场管理" , "关键词"}, button="编辑")
    @PostMapping("/update")
    public Object update(@RequestBody DtsKeyword keywords) {
        Object error = validate(keywords);
        if (error != null) {
            return error;
        }
        if (keywordService.updateById(keywords) == 0) {
            return ResponseUtil.updatedDataFailed();
        }
        return ResponseUtil.ok(keywords);
    }

    @RequiresPermissions("admin:keyword:delete")
    @RequiresPermissionsDesc(menu={"商场管理" , "关键词"}, button="删除")
    @PostMapping("/delete")
    public Object delete(@RequestBody DtsKeyword keyword) {
        Integer id = keyword.getId();
        if (id == null) {
            return ResponseUtil.badArgument();
        }
        keywordService.deleteById(id);
        return ResponseUtil.ok();
    }

}
