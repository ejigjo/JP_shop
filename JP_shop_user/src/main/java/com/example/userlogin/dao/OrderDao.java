package com.example.userlogin.dao;

import com.example.userlogin.model.Order;

import java.util.List;

public interface OrderDao {
    List<Order> getOrderbyId(Integer orderId);


}
