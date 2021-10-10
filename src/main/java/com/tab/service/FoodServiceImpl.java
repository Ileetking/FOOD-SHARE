package com.tab.service;

import com.github.pagehelper.PageHelper;
import com.tab.dao.FoodMapper;
import com.tab.dao.UserMapper;
import com.tab.pojo.Category;
import com.tab.pojo.Commentary;
import com.tab.pojo.Food;
import com.tab.pojo.User;

import java.util.List;

public class FoodServiceImpl implements FoodService{
    public FoodMapper foodMapper;
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    public int addFood(Food food) {
        return foodMapper.addFood(food);
    }

    public int updateFood(int fid) {
        return foodMapper.updateFood(fid);
    }

    public int deleteFood(int fid) {
        return foodMapper.deleteFood(fid);
    }

    public List<Food> queryFood(int page,int size) {
        PageHelper.startPage(page,size);
        return foodMapper.queryFood();
    }

    public List<Food> queryFoodById(int uid,int page,int size) {
        PageHelper.startPage(page,size);
        return foodMapper.queryFoodById(uid);
    }

    public String queryUserByFid(int fid) {
        return foodMapper.queryUserByFid(fid);
    }

    public List<Category> queryAll() {
        return foodMapper.queryAll();
    }

    public Food queryFoodByFid(int fid) {
        return foodMapper.queryFoodByFid(fid);
    }

    public String queryUsernameByUid(int uid) {
        return foodMapper.queryUsernameByUid(uid);
    }

    public List<Food> queryFoodByCid(int cid,int page,int size) {
        PageHelper.startPage(page,size);
        return foodMapper.queryFoodByCid(cid);
    }

    public List<Food> queryFoodBysearch(String search) {
        return foodMapper.queryFoodBysearch(search);
    }

    public List<Commentary> querycommentarysByFid(int fid) {
        return foodMapper.querycommentarysByFid(fid);
    }
    public int Addcommentary(Commentary commentary) {
        return foodMapper.Addcommentary(commentary);
    }

    public List<User> queryusersbyserch(String search) {
        return foodMapper.queryusersbyserch(search); }

}
