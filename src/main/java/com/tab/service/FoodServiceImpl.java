package com.tab.service;

import com.tab.dao.FoodMapper;
import com.tab.pojo.Category;
import com.tab.pojo.Commentary;
import com.tab.pojo.Food;

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

    public List<Food> queryFood() {
        return foodMapper.queryFood();
    }

    public List<Food> queryFoodById(int uid) {
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

    public List<Food> queryFoodByCid(int cid) {
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

}
