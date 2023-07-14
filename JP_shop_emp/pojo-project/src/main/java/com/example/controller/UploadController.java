package com.example.controller;

import com.example.pojo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Slf4j
@RestController
public class UploadController {

    // 需注意，本地上傳不是從資料庫調用資料

    @PostMapping("upload")
    public Result upload(String productName, String description, MultipartFile image) throws IOException {
        log.info("文件上傳:{},{},{}",productName, description, image);
        String filename = image.getOriginalFilename();
        //為了避免文件被覆寫，要將文件名字變成唯一值
        //UUID:
        image.transferTo(new File("/Users/chanshiti/Pictures/素材/"+filename));

        return Result.success();
    }
}
