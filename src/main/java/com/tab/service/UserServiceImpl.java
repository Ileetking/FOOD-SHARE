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
    public String getusernamebyuid(int uid) {return userMapper.getusernamebyuid(uid);}
    public int updateusername(HashMap hashMap) { return userMapper.updateusername(hashMap);}
    public int updategonggao(HashMap hashMap) { return userMapper.updategonggao(hashMap); }
    public String getgonggaobyuid(int uid) { return userMapper.getgonggaobyuid(uid);}
    public int updatezhuyemessage(HashMap hashMap) { return userMapper.updatezhuyemessage(hashMap); }
    public String getzhuyemessage(int uid) { return userMapper.getzhuyemessage(uid); }

}
