package com.example.service.impl;

import com.example.mapper.CategoryMapper;
import com.example.pojo.Category;
import com.example.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service // IOC 控制反轉, 這裡紅線很大，直接修復就可以自動實現接口
public class CategoryServiceImpl implements CategoryService {

    @Autowired // 依賴注入
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> list() {
        // 邏輯處理層：沒有邏輯處理的必要，只需要傳輸從Dao或者説mapper而來的數據即可
        return categoryMapper.list();
    }

    @Override
    public void delete(Integer id) {
        // 邏輯處理層：沒有邏輯處理的必要，增刪改查是mapper的工作
        categoryMapper.deleteById(id);
    }

    @Override
    public void add(Category category) {
        // 邏輯處理層：需要補全時間屬性
        category.setCreateTime(LocalDate.now());
        category.setUpdateTime(LocalDate.now());

        // 補全資料後，將數據交給mapper：調用mapper方法
        categoryMapper.insert(category);
    }


}
