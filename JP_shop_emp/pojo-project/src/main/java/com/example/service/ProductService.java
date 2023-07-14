package com.example.service;

import com.example.pojo.PageBean;
import com.example.pojo.Product;

import java.util.List;

public interface ProductService {
    /**
     * 用以分頁查詢
     * @param page
     * @param pageSize
     * @return
     */
    PageBean page(Integer page, Integer pageSize,
                  String productName, String pdType, Integer begin, Integer end);

    /** 用以實現批量刪除
     *
     * @param ids
     */
    void delete(List<Integer> ids);

    void save(Product product);

    Product getById(Integer id);

    void update(Product product);
}
