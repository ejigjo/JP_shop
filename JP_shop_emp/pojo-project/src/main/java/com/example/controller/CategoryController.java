package com.example.controller;

import com.example.pojo.Category;
import com.example.pojo.Result;
import com.example.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// 日誌記錄對象的註解，省去設定Logger log = LoggerFactory.getLogger(CategoryController.class)
@Slf4j
// @RequestMapping("/depts") 該註解用以將個方法中重複定義的路徑抽取出來，各方法在調用時統一由此註解使用路徑
@RequestMapping("/depts")
// @RestController是一個組合註解，裏面包含ResponseBody，可以將Result響應結果轉為JSON
@RestController
public class CategoryController {
    // Controller層弄好後，制定與Service的解耦
    // 將來Controller要獲取Service層的資料，就需要調用categoryService的list()
    @Autowired
    private CategoryService categoryService;

    /**
     * 實現功能: 查詢所有
     */
    // 如果沒有聲明方法method，則GET,POST都可以，這不利於管理，因此需要聲明方法 >> 輸入GET會自動補全指令
    // 經過改良，可以使用新註解-針對請求方法-簡化該寫法
    // 瀏覽器發送請求到服務端.. note:這裡地址用/depts是因為前端還沒修改
    //@RequestMapping(value = "/depts", method = RequestMethod.GET)
    @GetMapping
    public Result list() {
        // 階段性測試: 調用日誌記錄對象(辣椒粉)
        log.info("階段性測試: 查詢Category全部項目");

        // 調用categoryService的list()獲取Service層的資料
        List<Category> categoryList = categoryService.list();
        return Result.success(categoryList);
    }


    /**
     * 實現功能：刪除分類數據
     */
    // 註解1: @DeleteMapping: 用以@RequestController但優化路徑與功能
    // 註解2: @PathVariable: 用以傳遞參數 Result(code, msg, null)
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        // 輸出日誌：根據id刪除分類項目
        log.info("根據id刪除部門:{}", id);

        // 調用 categoryService 刪除分類 不需要返回值
        categoryService.delete(id);

        // 不用回傳信息，因此使用無參即可
        return Result.success();
    }

    /**
     * 實現功能：新增分類項目
     */
    // 註解1: @PostMapping 限制請求必須以POST請求
    // 註解2: @RequestBody 瀏覽器傳送請求為JSON，服務端使用RequestBody接收JSON並封裝為實體參數
    @PostMapping
    public Result add(@RequestBody Category category) {
        // 記錄日誌
        log.info("新增部門: {}", category);
        // 調用Service層的方法完成新增分類的操作 不用返回值
        categoryService.add(category);
        return Result.success();
    }
}
