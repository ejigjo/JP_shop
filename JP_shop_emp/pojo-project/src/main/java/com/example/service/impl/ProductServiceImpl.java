package com.example.service.impl;

import com.example.mapper.ProductMapper;
import com.example.pojo.PageBean;
import com.example.pojo.Product;
import com.example.service.ProductService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// 1. 業務邏輯層：調用mapper的資料1 total
// 2. 業務邏輯層：調用mapper的資料2 rows
// 3. 將total and rows 封裝成PageBean, 返回給Controller

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    // 原始版本
    /*
    @Override
    public PageBean page(Integer page, Integer pageSize) {
        // 1. 獲取總紀錄數 total
        Long total = productMapper.count();

        // 2. 獲取集合列表 productList
        Integer start = (page - 1) * pageSize;  // 起始頁碼start怎麼計算
        List<Product> productList = productMapper.page(start, pageSize);

        // 3. 將total與productList封裝成PageBean對象, 然後傳回
        PageBean pageBean = new PageBean(total, productList);
        return pageBean;
    }
     */

    // 用於分頁 + 條件查詢 安裝pageHelper後的版本
    @Override
    public PageBean page(Integer page, Integer pageSize,
                         String productName, String pdType, Integer begin, Integer end) {
        // 1.設置分頁參數
        PageHelper.startPage(page,pageSize);

        // 2.執行查詢
        List<Product> productList = productMapper.list(productName, pdType, begin, end);
        Page<Product> p = (Page<Product>) productList;

        // 3.封裝到PageBean對象內
        PageBean pageBean = new PageBean(p.getTotal(), p.getResult());
        return pageBean;
    }

    // 用於批量刪除
    @Override
    public void delete(List<Integer> ids) {
        // 沒有任何邏輯處理業務，也不用返回值
        productMapper.delete(ids);
    }

    // 用於新增商品
    @Override
    public void save(Product product) {
        // 不用補充基礎屬性
        // 直接傳給Mapper
        productMapper.insert(product);
    }

    // 用於修改商品信息 1:查詢回顯 需要回傳商品對象
    @Override
    public Product getById(Integer id) {
        return productMapper.getById(id);
    }

    @Override
    public void update(Product product) {
        // 沒有基礎數據要補充
        // 直接傳遞數據到mapper
        productMapper.update(product);
    }
}
