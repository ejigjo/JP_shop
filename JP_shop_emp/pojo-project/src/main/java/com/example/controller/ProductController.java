package com.example.controller;

import com.example.pojo.PageBean;
import com.example.pojo.Product;
import com.example.pojo.Result;
import com.example.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/emps")
public class ProductController {
    @Autowired
    ProductService productService;
    // 需要接收的參數是當前分頁page, 當前分頁的紀錄數pageSize
    // 調用service進行分頁查詢，最後得到PageBean
    // @RequestParam(defaultValue = "1")設置默認值
    //分頁+條件查詢商品項目
    @GetMapping
    public Result page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String productName, String pdType, Integer begin, Integer end) {
        // 設定日誌測試
        log.info("分頁查詢, 參數: {},{},{},{},{},{}", page, pageSize, productName, pdType, begin, end);
        // 調用Service方法，參數為page, pageSize
        // 有返回結果：封裝為PageBean
        PageBean pageBean = productService.page(page, pageSize, productName, pdType, begin, end);
        return Result.success(pageBean);
    }

    // 批量刪除商品項目ById
    // 形參裡是參數組成的集合 註解@PathVariable 因為ids是路徑變量
    @DeleteMapping("/{ids}")
    public Result delete(@PathVariable List<Integer> ids){
        // 紀錄日誌
        log.info("批量刪除操作, ids:{}", ids);
        productService.delete(ids);
        return Result.success();
    }

    // 新增商品
    // 註解1 請求方式 @PostMapping
    // 註解2 瀏覽器發出JSON的請求，透過實體類封裝 @RequestBody
    @PostMapping
    public Result save(@RequestBody Product product){
        log.info("新增商品, 商品:{}", product);
        productService.save(product);
        return Result.success();
    }

    // 修改商品信息1:查詢回顯
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id){
        log.info("根據id修改商品信息, id:{}", id);

        // 注意，修改商品項目存在返回值，需要傳回1個商品對象給瀏覽器
        Product product = productService.getById(id);
        return Result.success(product);
    }

    // 修改商品信息2:修改信息
    @PutMapping
    public Result update(@RequestBody Product product){
        log.info("更新商品信息:{}",product);

        productService.update(product);
        return Result.success();
    }

}
