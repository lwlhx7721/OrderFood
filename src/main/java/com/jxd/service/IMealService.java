package com.jxd.service;

import com.jxd.model.Meal;

import java.util.List;
import java.util.Map;

public interface IMealService {
    List<Map<String,Object>> getAllMeal(String mName);
    List<Map<String,Object>> getMealByPage(String mName,int pageIndex,int pageSize);
    boolean addMeal(String mName,double univalent);
    boolean updMeal(Meal meal);
    boolean delMeal(int mId);
}
