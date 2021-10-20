package com.tab.dao;

import com.tab.pojo.Dianzhang;
import com.tab.pojo.Liulan;
import com.tab.pojo.Shouchang;
import com.tab.pojo.User;

import javax.jws.soap.SOAPBinding;
import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    int addUser(User user);
   // String getPsw(String username);
    User getuser(String usernmae);
    int updateuserimage(HashMap hashMap);
    public String getusernamebyuid(int uid);
    public int updateusername(HashMap hashMap);
    public int updategonggao(HashMap hashMap);
    public String getgonggaobyuid(int uid);
    public int updatezhuyemessage(HashMap hashMap);
    public String  getzhuyemessage(int uid);
    public int adddianzhang(Dianzhang dianzhang);
    public int addshouchang(Shouchang shouchang);
    public int addliulan(Liulan liulan);
    public int removedianzhang(int id);
    public int removeshouchang(int id);
    public List<Liulan> getliulanbyfid(int fid);



}
