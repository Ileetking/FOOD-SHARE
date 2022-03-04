package com.tab.dao;

import com.tab.pojo.*;

import java.util.HashMap;
import java.util.List;

public interface FoodMapper {
    public int addFood(Food food);
    public int updateFood(int fid);
    public int deleteFood(int fid);
    public List<Food> queryFood();
    public List<Food> queryFoodById(int uid);
    public Food queryFoodByFid(int fid);
    public String queryUserByFid(int fid);
    public List<Category> queryAll();
    public String queryUsernameByUid(int uid);
    public List<Food> queryFoodByCid(int cid,String city);
    public List<Food> queryFoodBysearch(String search);
    public List<Commentary> querycommentarysByFid(int fid);
    public int Addcommentary(Commentary commentary);
    public List<User> queryusersbyserch(String serch);
    public int dianzan(Dianzhang dianzhang);
    public List<Dianzhang> queryDianzanby(int uid,int fid);
    public int chanledianzan(int uid,int fid);
    public List<Dianzhang> queryalldianzan(int fid);
    public List<Shouchang> queryallshouchang(int fid);
    public int shouchang(Shouchang shouchang);
    public List<Shouchang> queryShouchangby(int uid,int fid);
    public int chanleshouchang(int uid,int fid);
    public List<Liulan> allliulan(int fid);
    public List<Food> queryfoodbycity(String address);
    public List<Food> queryfoodbydianzan(int uid);
    public List<Food> queryfoodbyshouchang(int uid);
    public List<Food> queryfoodbypinglun(int uid);
    public int updateFood(HashMap hashMap);


}
