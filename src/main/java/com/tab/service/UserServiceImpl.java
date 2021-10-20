package com.tab.service;

import com.tab.dao.UserMapper;
import com.tab.pojo.Dianzhang;
import com.tab.pojo.Liulan;
import com.tab.pojo.Shouchang;
import com.tab.pojo.User;

import java.util.HashMap;
import java.util.List;

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
    public int adddianzhang(Dianzhang dianzhang){ return userMapper.adddianzhang(dianzhang); }
    public int addshouchang(Shouchang shouchang) { return userMapper.addshouchang(shouchang); }
    public int addliulan(Liulan liulan) { return userMapper.addliulan(liulan); }
    public int removedianzhang(int id) { return userMapper.removedianzhang(id); }
    public int removeshouchang(int id) {return userMapper.removeshouchang(id); }
    public List<Liulan> getliulanbyfid(int fid) { return userMapper.getliulanbyfid(fid); }


}
