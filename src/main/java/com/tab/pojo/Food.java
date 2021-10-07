package com.tab.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Food {
    private int fid;
    private String title;
    private String description;
    private String img;
    private String article;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String time;
    private int uid;
    private int cid;

}
