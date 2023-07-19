package com.example.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.reggie.dto.SetmealDto;
import com.example.reggie.entity.Setmeal;

public interface SetmealService extends IService<Setmeal> {
    /**
     * 新增套裝同時保存套裝與商品的關聯
     * @param setmealDto
     */
    public void saveWithDish(SetmealDto setmealDto);
}
