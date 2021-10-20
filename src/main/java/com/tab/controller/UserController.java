package com.tab.controller;

import com.github.pagehelper.PageInfo;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
    public String toresgiter(Model model)
    {
        model.addAttribute("errormsg","");
        return "user/resgiter";
    }
    @RequestMapping("/register")
    public String adduser(User user,Model model){
        System.out.println(user);
        String username=user.getUsername();
        if(user.getUsername().equals("")){
            model.addAttribute("errormsg","用户名不能为空!!");
            return "user/resgiter";
        }
        if(user.getPassword().equals("")){
            model.addAttribute("errormsg","密码不能为空!!");
            return "user/resgiter";
        }
        if(user.getPassword().length()<5){
            model.addAttribute("errormsg","密码长度不能小于5位~~");
            return "user/resgiter";
        }
         if(userService.getuser(username)!=null){
            model.addAttribute("errormsg","用户名重复~~");
            return "user/resgiter";
        }
        user.setUimage("muwangqing.jpg");
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
    public String addheadimage(MultipartFile file, int uid,HttpSession httpSession) throws IOException {
        System.out.println("头像UID："+uid);
            String userimagepath="D:\\FoodImages\\foodimage";
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
        httpSession.removeAttribute("uimage");
        String username= (String) httpSession.getAttribute("username");
        System.out.println("用户名为；"+httpSession.getAttribute("username"));
        httpSession.setAttribute("uimage",userService.getuser(username).getUimage());
        return "index1";
    }
    @RequestMapping("/usermessage/{uid}")
    public String usermessage(@PathVariable("uid")int uid, Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                              @RequestParam(name = "size",required = true,defaultValue = "16")int size){
        String username=userService.getusernamebyuid(uid);
        List<Food> userfoods=foodService.queryFoodById(uid,page,size);
        List<Integer> liulans=new ArrayList<Integer>();
        for (Food userfood : userfoods) {
            liulans.add(userService.getliulanbyfid(userfood.getFid()).size());
        }
        model.addAttribute("userliulan",liulans);
        PageInfo pageInfo=new PageInfo(userfoods);
        model.addAttribute("userimage",userService.getuser(username).getUimage());

        if(userService.getgonggaobyuid(uid)==null){
            model.addAttribute("gonggao","暂无公告~~");
        }
        else {
            String gonggao = userService.getgonggaobyuid(uid);
            model.addAttribute("gonggao",gonggao);
        }
        if(userService.getzhuyemessage(uid)==null){
            model.addAttribute("zhuyemessage","暂无描述~~");
        }
        else {
            String zhuyemessage = userService.getzhuyemessage(uid);
            model.addAttribute("zhuyemessage",zhuyemessage);
        }
        model.addAttribute("username",username);
        model.addAttribute("userfoods",pageInfo);
        return "user/user";
    }
    @RequestMapping("/updatename/{uid}")
    public String updatename(@PathVariable("uid")int uid,String username){
        if(userService.getusernamebyuid(uid).equals(username)){
            return "user/errormessage";
        }
        HashMap<String,Object> hashMap=new HashMap<String, Object>();
        hashMap.put("username",username);
        hashMap.put("uid",uid);
        userService.updateusername(hashMap);
        return "user/successmessage";
    }
    @RequestMapping("/updategonggao/{uid}")
    public String updategonggao(@PathVariable("uid")int uid,String gonggao){
        HashMap<String,Object> hashMap=new HashMap<String, Object>();
        hashMap.put("gonggao",gonggao);
        hashMap.put("uid",uid);
        userService.updategonggao(hashMap);
        return "user/successmessage";
    }
  @RequestMapping("tozuye")
    public String tozhuyemamage(HttpServletRequest request){
        if(request.getSession().getAttribute("username")!=null){
            return "user/usermanage";
        }
        return "user/login";
    }
    @RequestMapping("/updatezhuyemessage/{uid}")
    public String updatezhuyemessage(@PathVariable("uid")int uid,String zhuyemessage){
        HashMap<String,Object> hashMap=new HashMap<String, Object>();
        hashMap.put("zhuyemessage",zhuyemessage);
        hashMap.put("uid",uid);
        userService.updatezhuyemessage(hashMap);
        return "user/successmessage";
    }

}
