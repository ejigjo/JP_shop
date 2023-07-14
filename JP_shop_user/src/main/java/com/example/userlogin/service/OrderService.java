package com.example.userlogin.service;

import com.example.userlogin.model.Order;

import java.util.List;

public interface OrderService {
    List<Order> getOrderbyId(Integer orderId);
}
