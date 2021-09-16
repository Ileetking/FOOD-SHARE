package com.tab.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.annotations.AutomapConstructor;

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
    private Date time;
    private int uid;
    private int cid;
}
