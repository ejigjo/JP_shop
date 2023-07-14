package com.example.userlogin.controller;

import com.example.userlogin.model.Order;
import com.example.userlogin.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/user/{orderId}/orders")
    public ResponseEntity<List<Order>> getOrder(@PathVariable Integer orderId){
        List<Order> orderList = orderService.getOrderbyId(orderId);

        return ResponseEntity.status(HttpStatus.OK).body(orderList);
    }

}
