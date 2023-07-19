package com.example.reggie.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.reggie.common.R;
import com.example.reggie.entity.Category;
import com.example.reggie.entity.Employee;
import com.example.reggie.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 新增分類
     */
    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Category category){
        log.info("category: {}",category);
        categoryService.save(category);
        return R.success("新增分類成功");
    }

    /** 分頁查詢
     *
     */
    @GetMapping("/page")
    public R<Page> page(int page, int pageSize) {
        // 創建分頁構造器
        Page pageInfo = new Page(page,pageSize);
        // 創建條件構造器
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        // 添加排序
        queryWrapper.orderByAsc(Category::getSort);
        // 執行查詢
        categoryService.page(pageInfo,queryWrapper);
        return R.success(pageInfo);
    }

    /**
     * 刪除分類
     */
    @DeleteMapping
    public R<String> delete(Long id){
        log.info("刪除分類, id為{}:", id);
        categoryService.remove(id);
        return R.success("分類信息刪除成功");
    }

    /** 根據ID修改分類信息
     */
    @PutMapping
    public R<String> update(@RequestBody Category category){
        log.info("修改分類信息:{}", category);
        categoryService.updateById(category);
        return R.success("修改分類信息成功");
    }

    /**
     * 根據條件動態查詢分類數據
     */
    @GetMapping("/list")
    public R<List<Category>> list(Category category){
        //條件構造器
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        //添加條件
        queryWrapper.eq(category.getType() != null, Category::getType, category.getType());
        //添加排序條件
        queryWrapper.orderByAsc(Category::getSort).orderByDesc(Category::getUpdateTime);
        //最終返回列表的集合
        List<Category> list = categoryService.list(queryWrapper);
        return R.success(list);
    }

}
