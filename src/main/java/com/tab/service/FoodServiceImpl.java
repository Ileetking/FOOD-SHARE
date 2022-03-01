package com.tab.service;

import com.github.pagehelper.PageHelper;
import com.tab.dao.FoodMapper;
import com.tab.dao.UserMapper;
import com.tab.pojo.*;

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

    public int dianzan(Dianzhang dianzhang) {
        return foodMapper.dianzan(dianzhang);
    }

    public List<Dianzhang> queryDianzanby(int uid, int fid) {
        return foodMapper.queryDianzanby(uid,fid);
    }

    public int chanledianzan(int uid, int fid) {
        return foodMapper.chanledianzan(uid,fid);
    }

    public int shouchang(Shouchang shouchang) {
        return foodMapper.shouchang(shouchang);
    }

    public List<Shouchang> queryShouchangby(int uid, int fid) {
        return foodMapper.queryShouchangby(uid,fid);
    }

    public int chanleshouchang(int uid, int fid) {
        return foodMapper.chanleshouchang(uid,fid);
    }

    public List<Dianzhang> queryalldianzan(int fid) {
        return foodMapper.queryalldianzan(fid);
    }

    public List<Shouchang> queryallshouchang(int fid) {
        return foodMapper.queryallshouchang(fid);
    }

    public List<Liulan> allliulan(int fid) {
        return foodMapper.allliulan(fid);
    }


}
