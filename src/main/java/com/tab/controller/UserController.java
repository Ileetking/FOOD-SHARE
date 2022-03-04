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
    public String adduser(User user,Model model,String confpassword,String verification,String codeu){
        System.out.println(user);
        System.out.println("con::"+verification+"code:"+codeu);
        String username=user.getUsername();
        if(user.getUsername().equals("")){
            model.addAttribute("errormsg","用户名不能为空!!");
            return "user/resgiter";
        }
        if(user.getPassword().equals("")){
            model.addAttribute("errormsg","密码不能为空!!");
            return "user/resgiter";
        }
        if(verification.equals("")){
            model.addAttribute("errormsg","验证码不能为空!!");
            return "user/resgiter";
        }
        if(user.getPassword().length()<5){
            model.addAttribute("errormsg","密码长度不能小于5位~~");
            return "user/resgiter";
        }
        if(!user.getPassword().equals(confpassword)){
            model.addAttribute("errormsg","两次密码输入不一致");
            return "user/resgiter";
        }
        if(!verification.toUpperCase().equals(codeu.toUpperCase())){
            model.addAttribute("errormsg","验证码错误，请重新输入!!");
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
    public String login(String username, String password, HttpSession httpSession,String verification,String codeu) throws Exception {
//        httpSession.removeAttribute("loginmsg");
        System.out.println("ver:"+verification+"co:"+codeu);
         if(userService.getuser(username)!=null){
             if(password.equals("")) {
                 httpSession.setAttribute("loginmsg","密码不能为空！");
                 return "user/login";
             }
             else if(verification.equals("")){
                 httpSession.setAttribute("loginmsg","验证码不能为空!!");
                 return "user/login";
             }
             else if(!verification.toUpperCase().equals(codeu.toUpperCase())){
                 httpSession.setAttribute("loginmsg","验证码错误，请重新输入!!");
                 return "user/login";
             }
            else if(userService.getuser(username).getPassword().equals(password)){
                 httpSession.setAttribute("username",username);
                 System.out.println("uid为："+userService.getuser(username).getUid());
                 IpUtil getlocalip=new IpUtil();
//            System.out.println("当前的本地ip地址为："+IpUtil.getIpAddress(request));
//            System.out.println("当前的局域网ip地址为："+getlocalip.getLocalHostIP());
                 System.out.println("当前的地理地址为："+getlocalip.getipjson(getlocalip.getV4IP()));
                 httpSession.setAttribute("uid",userService.getuser(username).getUid());
                 httpSession.setAttribute("uimage",userService.getuser(username).getUimage());
                 httpSession.setAttribute("address",getlocalip.getipjson(getlocalip.getV4IP()));
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
         else if(verification.equals("")){
             httpSession.setAttribute("loginmsg","验证码不能为空!!");
             return "user/login";
         }
         else if(!verification.toUpperCase().equals(codeu.toUpperCase())){
             httpSession.setAttribute("loginmsg","验证码错误，请重新输入!!");
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
    @RequestMapping("touserdianzan")
    public String touserdianzan(HttpServletRequest request){
        if(request.getSession().getAttribute("username")!=null){
            return "user/userdianzan";
        }
        return "user/login";
    }
    @RequestMapping("/userdianzan/{uid}")
    public String userdianzan(@PathVariable("uid")int uid, Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                              @RequestParam(name = "size",required = true,defaultValue = "16")int size){
        if(uid==0){
            return "user/loginerror";
        }
        String username=userService.getusernamebyuid(uid);
        List<Food> userfoods=foodService.queryfoodbydianzan(uid,page,size);
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
        return "user/userdianzan";
    }

    @RequestMapping("/usershouchang/{uid}")
    public String usershouchang(@PathVariable("uid")int uid, Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                              @RequestParam(name = "size",required = true,defaultValue = "16")int size){
        if(uid==0){
            return "user/loginerror";
        }
        String username=userService.getusernamebyuid(uid);
        List<Food> userfoods=foodService.queryfoodbyshouchang(uid,page,size);
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
        return "user/usershouchang";
    }

    @RequestMapping("/userpinlun/{uid}")
    public String userpinlun(@PathVariable("uid")int uid, Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                                @RequestParam(name = "size",required = true,defaultValue = "16")int size){
        if(uid==0){
            return "user/loginerror";
        }
        String username=userService.getusernamebyuid(uid);
        List<Food> userfoods=foodService.queryfoodbypinglun(uid,page,size);
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
        return "user/usershouchang";
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
    @RequestMapping("/tofujing")
    public String tofujing(HttpServletRequest request){
        if(request.getSession().getAttribute("username")!=null){
            return "index3";
        }
        return "user/login";
    }
    @RequestMapping("useradmin/{uid}")
    public String useradmin(@PathVariable("uid")int uid,Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                            @RequestParam(name = "size",required = true,defaultValue = "16")int size){
        List<Food> foods=new ArrayList<Food>();
        List<String> usernames=new ArrayList<String>();
        List<Integer> liulans=new ArrayList<Integer>();
        foods=foodService.queryFoodById(uid,page,size);
        for (Food food : foods) {
            usernames.add(foodService.queryUsernameByUid(food.getUid()));
            liulans.add(userService.getliulanbyfid(food.getFid()).size());
        }
        PageInfo pageInfo=new PageInfo(foods);
        System.out.println("dd"+foods.toString()+"uid:"+uid);
        model.addAttribute("liulansize",liulans);
        model.addAttribute("usernames",usernames);
        model.addAttribute("foods",pageInfo);
        return "user/useradmin";
    }

}
