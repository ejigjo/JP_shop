package com.example.service;

import com.example.pojo.Category;

import java.util.List;

public interface CategoryService {
    // 用來查詢全部分類數據
    List<Category> list();

    // 用來根據id刪除分類
    void delete(Integer id);

    // 用來根據id新增分類
    void add(Category category);
}
