package com.tab.dao;

import com.tab.pojo.User;

import javax.jws.soap.SOAPBinding;
import java.util.HashMap;

public interface UserMapper {
    int addUser(User user);
   // String getPsw(String username);
    User getuser(String usernmae);
    int updateuserimage(HashMap hashMap);
    public String getusernamebyuid(int uid);


}
