package com.example.userlogin.service.impl;

import com.example.userlogin.dao.OrderDao;
import com.example.userlogin.model.Order;
import com.example.userlogin.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Override
    public List<Order> getOrderbyId(Integer orderId) {
        return orderDao.getOrderbyId(orderId);
    }
}
