package com.example.reggie.controller;

import com.example.reggie.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 負責檔案的上傳與下載
 */
@Slf4j
@RestController
@RequestMapping("/common")
public class CommonController {
    // 取得路徑
    static String basPath = "/Users/chanshiti/Pictures/storageImages/";

    // 將頁面中上傳的檔案載入到路徑設定的位址
    @PostMapping("/upload")
    public R<String> upload(MultipartFile file) { //file參數需要與前端的name保持一致
        log.info(file.toString());
        // 取得檔案名稱
        String originalFilename = file.getOriginalFilename(); //1.jpg
        // 取得後綴名
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 重新生成檔案名(UUID)
        String fileName = UUID.randomUUID().toString() + suffix;
        try {
            file.transferTo(new File(basPath + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.success(fileName);
    }

    // 將上傳的檔案響應在頁面上
    @GetMapping("/download")
    public void download(String name, HttpServletResponse response) {
        try {
            // 輸入流讀取文件名稱
            FileInputStream FIS = new FileInputStream(new File(basPath + name));
            // 輸出流將檔案寫回頁面，於是頁面可以展示圖片
            ServletOutputStream OS = response.getOutputStream();
            response.setContentType("image/jpeg");

            // 讀取文件
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = FIS.read(bytes)) != -1) {
                OS.write(bytes, 0, len);
                OS.flush();
            }
            OS.close();
            FIS.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
