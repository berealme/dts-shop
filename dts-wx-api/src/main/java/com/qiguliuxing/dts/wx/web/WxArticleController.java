package com.qiguliuxing.dts.wx.web;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.db.domain.DtsArticle;
import com.qiguliuxing.dts.db.service.DtsArticleService;

/**
 * 用户收货地址服务
 */
@RestController
@RequestMapping("/wx/article")
@Validated
public class WxArticleController {

	@Autowired
	private DtsArticleService articleService;
	
	
	 /**
     * 文章公告信息
     *
     * @param id 文章ID
     * @return 文章详情
     */
    @GetMapping("detail")
    public Object detail(@NotNull Integer id) {
        DtsArticle article = articleService.findById(id);
        return ResponseUtil.ok(article);
    }
}
