package com.qiguliuxing.dts.wx.web;

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

import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.db.domain.DtsBrand;
import com.qiguliuxing.dts.db.service.DtsBrandService;

/**
 * 专题服务
 */
@RestController
@RequestMapping("/wx/brand")
@Validated
public class WxBrandController {

    @Autowired
    private DtsBrandService brandService;

    /**
     * 品牌列表
     *
     * @param page 分页页数
     * @param size 分页大小
     * @return 品牌列表
     */
    @GetMapping("list")
    public Object list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer size) {

        List<DtsBrand> brandList = brandService.queryVO(page, size);
        int total = brandService.queryTotalCount();
        int totalPages = (int) Math.ceil((double) total / size);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("brandList", brandList);
        data.put("totalPages", totalPages);
        return ResponseUtil.ok(data);
    }

    /**
     * 品牌详情
     *
     * @param id 品牌ID
     * @return 品牌详情
     */
    @GetMapping("detail")
    public Object detail(@NotNull Integer id) {
        DtsBrand entity = brandService.findById(id);
        if (entity == null) {
            return ResponseUtil.badArgumentValue();
        }

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("brand", entity);
        return ResponseUtil.ok(data);
    }
}