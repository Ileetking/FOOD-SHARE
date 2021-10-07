package com.tab.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.tab.pojo.Food;
import com.tab.pojo.User;
import com.tab.service.FoodService;
import com.tab.service.FoodServiceImpl;
import com.tab.service.UserService;
import com.util.IpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("FoodServiceImpl")
    private FoodService foodService;
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
    public String login(String username, String password, HttpSession httpSession, Model model) throws Exception {
//        httpSession.removeAttribute("loginmsg");
         if(userService.getuser(username)!=null){
             if(password.equals("")) {
                 httpSession.setAttribute("loginmsg","密码不能为空！");
                 return "user/login";
             }
            else if(userService.getuser(username).getPassword().equals(password)){
                 httpSession.setAttribute("username",username);
                 System.out.println("uid为："+userService.getuser(username).getUid());
                 IpUtil getlocalip=new IpUtil();
//            System.out.println("当前的本地ip地址为："+IpUtil.getIpAddress(request));
//            System.out.println("当前的局域网ip地址为："+getlocalip.getLocalHostIP());
                 System.out.println("当前的地理地址为："+getlocalip.getipjson(IpUtil.getV4IP()));
                 httpSession.setAttribute("uid",userService.getuser(username).getUid());
                 httpSession.setAttribute("uimage",userService.getuser(username).getUimage());
                 httpSession.setAttribute("address",getlocalip.getipjson(IpUtil.getV4IP()));
                 return "index1";
             }
             else
             {
                 httpSession.setAttribute("loginmsg","请重试密码！");
                 return "user/login";
             }

         }

         else if(username.equals("")){
             httpSession.setAttribute("loginmsg","用户不能为空！");
             return "user/login";
         }
         else if(password.equals("")) {
             httpSession.setAttribute("loginmsg","密码不能为空！");
             return "user/login";
         }
         else{
             httpSession.setAttribute("loginmsg","用户不存在！");
             return "user/login";
         }

    }
    @RequestMapping("/removese")
    public String removese(HttpSession httpSession){
        httpSession.invalidate();
        return "index1";
    }
    @RequestMapping("/updateuserimage")
    public String addheadimage(MultipartFile file, int uid) throws IOException {
        System.out.println("头像UID："+uid);
            String userimagepath="D:\\FoodImages\\userimage";
        File file2=new File(userimagepath);
        if(!file2.exists()){
            file2.mkdir();
        }
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
    @RequestMapping("/usermessage/{uid}")
    public String usermessage(@PathVariable("uid")int uid, Model model){
        System.out.println("uid为："+uid);
        List<Food> userfoods=foodService.queryFoodById(uid);
        System.out.println(userfoods);
        System.out.println("有多少个"+userfoods.size());
        model.addAttribute("username",userService.getusernamebyuid(uid));
        model.addAttribute("userfoods",userfoods);
        return "user/user";
    }
}
