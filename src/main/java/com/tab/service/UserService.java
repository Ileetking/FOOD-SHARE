package com.tab.service;

import com.tab.pojo.User;

import java.util.HashMap;

public interface UserService {

    int addUser(User user);
    User getuser(String username);
    int updateuserimage(HashMap hashMap);
    String getusernamebyuid(int uid);
    int updateusername(HashMap hashMap);
    int updategonggao(HashMap hashMap);
    String getgonggaobyuid(int uid);
    int updatezhuyemessage(HashMap hashMap);
    String getzhuyemessage(int uid);

}
