package com.jxd.dao;

import com.jxd.model.Meal;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IMealDao {
    List<Map<String,Object>> getAllMeal(String mName);
    List<Map<String,Object>> getMealByPage(@Param("mName") String mName, @Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
    boolean addMeal(@Param("mName") String mName,@Param("univalent") double univalent);
    boolean updMeal(Meal meal);
    boolean delMeal(int mId);
}
