package com.tab.service;

import com.tab.pojo.Dianzhang;
import com.tab.pojo.Liulan;
import com.tab.pojo.Shouchang;
import com.tab.pojo.User;

import java.util.HashMap;
import java.util.List;

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
    int adddianzhang(Dianzhang dianzhang);
    int addshouchang(Shouchang shouchang);
    int addliulan(Liulan liulan);
    int removedianzhang(int id);
    int removeshouchang(int id);
    List<Liulan> getliulanbyfid(int fid);


}
