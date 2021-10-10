package com.tab.service;

import com.tab.pojo.Category;
import com.tab.pojo.Commentary;
import com.tab.pojo.Food;
import com.tab.pojo.User;

import java.util.List;

public interface FoodService {
    public int addFood(Food food);
    public int updateFood(int fid);
    public int deleteFood(int fid);
    public List<Food> queryFood(int page,int size);
    public List<Food> queryFoodById(int uid,int page,int size);
    public String queryUserByFid(int fid);
    public List<Category> queryAll();
    public Food queryFoodByFid(int fid);
    public String queryUsernameByUid(int uid);
    public List<Food> queryFoodByCid(int cid,int page,int size);
    public List<Food> queryFoodBysearch(String search);
    public List<Commentary> querycommentarysByFid(int fid);
    public int Addcommentary(Commentary commentary);
    public List<User> queryusersbyserch(String search);
}
