package com.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private Integer id;
    private String productName;
    private String description;
    private String image;
    private Integer price;
    private Integer categoryId;
    private String pdType;
}
