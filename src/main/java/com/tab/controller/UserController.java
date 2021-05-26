package com.tab.controller;

import com.tab.pojo.User;
import com.tab.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @RequestMapping("/toresgiter")
    public String toresgiter(){
        return "user/resgiter";
    }
    @RequestMapping("/register")
    public String adduser(User user){
        System.out.println(user);
         userService.addUser(user);
         return "user/login";
    }
    @RequestMapping("/tologin")
    public String tologin(){
        return "user/login";
    }


    @RequestMapping("/login")
    public String login(String username, String password, HttpSession httpSession){
        if(userService.getuser(username).getPassword().equals(password)){
            httpSession.setAttribute("username",username);
            System.out.println("uid为："+userService.getuser(username).getUid());
            httpSession.setAttribute("uid",userService.getuser(username).getUid());
            httpSession.setAttribute("uimage",userService.getuser(username).getUimage());
            return "index1";
        }
        else
            return "user/login";
    }
    @RequestMapping("/removese")
    public String removese(HttpSession httpSession){
        httpSession.invalidate();
        return "index1";
    }
    @RequestMapping("/updateuserimage")
    public String addheadimage(MultipartFile file, int uid) throws IOException {
        System.out.println("头像UID："+uid);
            String userimagepath="D:\\IdeaProjects\\FOOD-SHARE\\web\\userimage";
            String getfilename=file.getOriginalFilename();
            String newfilename=UUID.randomUUID()+getfilename  ;
           File file1=new File(userimagepath,newfilename);
           System.out.println(newfilename);
           file.transferTo(file1);
        HashMap<String,Object> hashMap=new HashMap<String, Object>();
        hashMap.put("uimage",newfilename);
        hashMap.put("uid",uid);
            userService.updateuserimage(hashMap);
        return "index1";
    }
}
