package com.qiguliuxing.dts.admin.web;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.qiguliuxing.dts.admin.annotation.RequiresPermissionsDesc;
import com.qiguliuxing.dts.core.storage.StorageService;
import com.qiguliuxing.dts.core.util.ResponseUtil;
import com.qiguliuxing.dts.core.validator.Order;
import com.qiguliuxing.dts.core.validator.Sort;
import com.qiguliuxing.dts.db.domain.DtsStorage;
import com.qiguliuxing.dts.db.service.DtsStorageService;

@RestController
@RequestMapping("/admin/storage")
@Validated
public class AdminStorageController {

    @Autowired
    private StorageService storageService;
    @Autowired
    private DtsStorageService DtsStorageService;

    @RequiresPermissions("admin:storage:list")
    @RequiresPermissionsDesc(menu={"系统管理" , "对象存储"}, button="查询")
    @GetMapping("/list")
    public Object list(String key, String name,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer limit,
                       @Sort @RequestParam(defaultValue = "add_time") String sort,
                       @Order @RequestParam(defaultValue = "desc") String order) {
        List<DtsStorage> storageList = DtsStorageService.querySelective(key, name, page, limit, sort, order);
        long total = PageInfo.of(storageList).getTotal();
        Map<String, Object> data = new HashMap<>();
        data.put("total", total);
        data.put("items", storageList);

        return ResponseUtil.ok(data);
    }

    @RequiresPermissions("admin:storage:create")
    @RequiresPermissionsDesc(menu={"系统管理" , "对象存储"}, button="上传")
    @PostMapping("/create")
    public Object create(@RequestParam("file") MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String url = storageService.store(file.getInputStream(), file.getSize(), file.getContentType(), originalFilename);
        Map<String, Object> data = new HashMap<>();
        data.put("url", url);
        return ResponseUtil.ok(data);
    }

    @RequiresPermissions("admin:storage:read")
    @RequiresPermissionsDesc(menu={"系统管理" , "对象存储"}, button="详情")
    @PostMapping("/read")
    public Object read(@NotNull Integer id) {
        DtsStorage storageInfo = DtsStorageService.findById(id);
        if (storageInfo == null) {
            return ResponseUtil.badArgumentValue();
        }
        return ResponseUtil.ok(storageInfo);
    }

    @RequiresPermissions("admin:storage:update")
    @RequiresPermissionsDesc(menu={"系统管理" , "对象存储"}, button="编辑")
    @PostMapping("/update")
    public Object update(@RequestBody DtsStorage DtsStorage) {
        if (DtsStorageService.update(DtsStorage) == 0) {
            return ResponseUtil.updatedDataFailed();
        }
        return ResponseUtil.ok(DtsStorage);
    }

    @RequiresPermissions("admin:storage:delete")
    @RequiresPermissionsDesc(menu={"系统管理" , "对象存储"}, button="删除")
    @PostMapping("/delete")
    public Object delete(@RequestBody DtsStorage DtsStorage) {
        String key = DtsStorage.getKey();
        if (StringUtils.isEmpty(key)) {
            return ResponseUtil.badArgument();
        }
        DtsStorageService.deleteByKey(key);
        storageService.delete(key);
        return ResponseUtil.ok();
    }
}
