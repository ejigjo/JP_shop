package com.example.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.reggie.dto.DishDto;
import com.example.reggie.entity.Dish;

public interface DishService extends IService<Dish> {
    // 新增商品同時插入對應特色表單
    public void saveWithFlavor(DishDto dishDto);
    //根據ID查詢對應特色信息
    public DishDto getByIdWithFlavor(Long id);
    //更新商品信息與特色信息
    public void updateWithFlavor(DishDto dishDto);
}
