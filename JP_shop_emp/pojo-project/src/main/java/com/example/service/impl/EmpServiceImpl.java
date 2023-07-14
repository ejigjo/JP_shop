package com.example.service.impl;

import com.example.mapper.EmpMapper;
import com.example.pojo.Emp;
import com.example.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    @Override
    public Emp login(Emp emp) {
        // 沒有邏輯處理需求，傳送數據到mapper，結果emp回傳Controller
        // 需注意：mapper持久層的本質工作是對資料庫的管理，而非真的登錄，所以這裡改個名字
        return empMapper.getByUserNameAndPassword(emp);
    }
}
