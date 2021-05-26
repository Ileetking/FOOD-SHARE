package com.tab.service;

import com.tab.pojo.User;

import java.util.HashMap;

public interface UserService {

    int addUser(User user);
    User getuser(String username);
    int updateuserimage(HashMap hashMap);
}
