package com.util;


import com.alibaba.fastjson.JSONObject;

import java.util.Collections;
import java.util.List;

/**
 * Created by T.a.b
 * Date:2021/10/1
 * Time: 23:07
 */
public class JsonUtil {
    public String ipjson(String json){
        String data0="";
        JSONObject jsonObject = JSONObject.parseObject(json);
        for (int i = 1; i < 4; i++) {
            data0+=jsonObject.getJSONArray("data").get(i);
        }
         return data0;

    }
}
