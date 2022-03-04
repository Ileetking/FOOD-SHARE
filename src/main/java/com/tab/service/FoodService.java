package com.tab.service;

import com.tab.pojo.*;

import java.util.HashMap;
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
    public List<Food> queryFoodByCid(int cid,String city,int page,int size);
    public List<Food> queryFoodBysearch(String search);
    public List<Commentary> querycommentarysByFid(int fid);
    public int Addcommentary(Commentary commentary);
    public List<User> queryusersbyserch(String search);
    public int dianzan(Dianzhang dianzhang);
    public List<Dianzhang> queryDianzanby(int uid,int fid);
    public int chanledianzan(int uid,int fid);
    public int shouchang(Shouchang shouchang);
    public List<Shouchang> queryShouchangby(int uid,int fid);
    public int chanleshouchang(int uid,int fid);
    public List<Dianzhang> queryalldianzan(int fid);
    public List<Shouchang> queryallshouchang(int fid);
    public List<Liulan> allliulan(int fid);
    public List<Food> queryfoodbycity(String address);
    public List<Food> queryfoodbydianzan(int uid,int page,int size);
    public List<Food> queryfoodbyshouchang(int uid,int page,int size);
    public List<Food> queryfoodbypinglun(int uid,int page,int size);
    public int updateFood(HashMap hashMap);
}
