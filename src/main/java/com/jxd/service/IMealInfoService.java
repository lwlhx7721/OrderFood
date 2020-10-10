package com.jxd.service;

import com.jxd.model.MealInfo;

import java.util.List;

public interface IMealInfoService {
    List<MealInfo> getAllMealInfo(int empno);
    List<MealInfo> getAllMealInfoByPage(int empno, int pageIndex, int pageSize);
    boolean updMealInfoState(int onum,int state);
    boolean addMealInfo(MealInfo mealInfo);
    List<MealInfo> getAllMealInfoByEmp(int anum);
    List<MealInfo> getAllMealInfoByEmpAndPage(int anum,int pageIndex,int pageSize);
}
