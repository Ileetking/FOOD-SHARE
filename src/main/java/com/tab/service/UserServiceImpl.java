package com.tab.service;

import com.tab.dao.UserMapper;
import com.tab.pojo.User;

import java.util.HashMap;

public class UserServiceImpl implements UserService {
    public UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper=userMapper;
    }
    public int addUser(User user) {
        return userMapper.addUser(user);
    }
    public User getuser(String username) {
        return userMapper.getuser(username);
    }
    public int updateuserimage(HashMap hashMap) {
        return userMapper.updateuserimage(hashMap);
    }
}
