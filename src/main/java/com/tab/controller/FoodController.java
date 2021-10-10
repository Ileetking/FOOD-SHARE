package com.tab.controller;
/**
 * 食物分享业务控制器，包括跳转路由
 */
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tab.pojo.Category;
import com.tab.pojo.Commentary;
import com.tab.pojo.Food;
import com.tab.pojo.User;
import com.tab.service.FoodService;
import com.tab.service.UserService;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
@Controller
@RequestMapping("/food")
public class FoodController {
    @Autowired
    @Qualifier("FoodServiceImpl")
    private FoodService foodService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @RequestMapping("/addFood")
    public String addFood(Food food, MultipartFile file,HttpSession session) throws IOException {

        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "D:\\FoodImages\\foodimage";
        File file1=new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        // 获取原始图片的扩展名
        System.out.println("开始结果：");
        //System.out.println("article为："+article);
        String originalFilename = file.getOriginalFilename();

        System.out.println(originalFilename);
        // 生成文件新的名字
        String newFileName = UUID.randomUUID() + originalFilename;
        System.out.println(newFileName);
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        System.out.println(targetFile);
        //file.transferTo(targetFile);
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        String datime=format.format(date);
        System.out.println(date);

        System.out.println("cid为："+food.getCid());
        //System.out.println(Integer.parseInt(cid));
        // 保存到数据库
        food.setTime(datime);
        //food.setCid(Integer.parseInt(cid));
        file.transferTo(targetFile);
        food.setImg(newFileName);
        String address= (String) session.getAttribute("address");
        food.setAddress(address);
       foodService.addFood(food);
       return "redirect:/food/allfood";
    }
@RequestMapping("/toaddFood")
    public String toaddFood(Model model, HttpServletRequest request){
        if(request.getSession().getAttribute("username")!=null){
            List<Category> allname= foodService.queryAll();
            model.addAttribute("allname",allname);
            return "food/addfood";
        }else {
            return "user/login";
        }

    }
    @RequestMapping("/allfood")
    public String allfood(Model model,
                          @RequestParam(name = "page",required = true,defaultValue = "1")int page,
                          @RequestParam(name = "size",required = true,defaultValue = "18")int size){
            List<Category> allname= foodService.queryAll();
            List<Food> foods=foodService.queryFood(page, size);
            List<String> usernames=new ArrayList<String>();
        for (Food food : foods) {
            usernames.add(foodService.queryUsernameByUid(food.getUid()));
        }
        PageInfo pageInfo=new PageInfo(foods);

            model.addAttribute("usernames",usernames);
            model.addAttribute("allname1",allname);
            model.addAttribute("foods",pageInfo);
        return "index";
    }
    @RequestMapping("/article1/{fid}")
    public String queryfoodbyid(@PathVariable("fid")int fid, Model model){
        System.out.println("fid："+fid);
      Food food=foodService.queryFoodByFid(fid);
        model.addAttribute("food",food);
        model.addAttribute("username",foodService.queryUsernameByUid(food.getUid()));
        return "food/article";
    }
    @RequestMapping("/categoryfood/{cid}")
   public String querycategorybyid(@PathVariable("cid")int cid,Model model,@RequestParam(name = "page",required = true,defaultValue = "1")int page,
                                   @RequestParam(name = "size",required = true,defaultValue = "18")int size){
        List<Category> allname= foodService.queryAll();
        List<Food> foods=foodService.queryFoodByCid(cid,page,size);
        List<String> usernames=new ArrayList<String>();
        for (Food food : foods) {
            usernames.add(foodService.queryUsernameByUid(food.getUid()));
        }
        PageInfo pageInfo=new PageInfo(foods);
        model.addAttribute("usernames",usernames);
        model.addAttribute("allname1",allname);
        model.addAttribute("foods",pageInfo);
        return "index";
   }
   @RequestMapping("/searchfood")
   public String queryfoodBysearch(String search,Model model){
       List<Category> allname= foodService.queryAll();
        List<Food> foods=foodService.queryFoodBysearch(search);
        List<User> users=foodService.queryusersbyserch(search);
        model.addAttribute("foods",foods);
        model.addAttribute("nouser","");
        model.addAttribute("nofood","");
        if(users.size()==0){
            model.addAttribute("nouser","找不到该用户~~");
        }
        if(foods.size()==0){
            model.addAttribute("nofood","很抱歉找不到该美食~~");
        }
        System.out.println(users);
        model.addAttribute("users",users);
        model.addAttribute("allname1",allname);
        return "food/serch";
   }
   @RequestMapping("/addcommentary")
   public  String Addcommentary(int fid, Commentary commentary, Model model){
            Date date=new Date();
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            String datime=format.format(date);
            commentary.setTime(datime);
            foodService.Addcommentary(commentary);
            model.addAttribute("fid",fid);
            return "food/article1";

   }
   @RequestMapping("/commentaries/{fid}")
    public String querycommentarysByFid(@PathVariable("fid") int fid,Model model){
       Food food=foodService.queryFoodByFid(fid);
       String username=foodService.queryUsernameByUid(food.getUid());
       model.addAttribute("food",food);
       model.addAttribute("userimage",userService.getuser(username).getUimage());
       model.addAttribute("username",username);
       List<Commentary> commentaries=foodService.querycommentarysByFid(fid);
       List<String> userimages=new ArrayList<String>();
       for (Commentary commentary : commentaries) {

//           System.out.println("id为："+commentary.getUid());
//           System.out.println("username为："+foodService.queryUsernameByUid(commentary.getUid()));
//           System.out.println(userService.getuser(foodService.queryUsernameByUid(commentary.getUid())));
           userimages.add(commentary.getUser().getUimage());
       }
            model.addAttribute("commentaries",commentaries);
            model.addAttribute("userimages",userimages);
            return "food/article";
    }

}
