package com.jxd.service.impl;

import com.jxd.dao.IMealDao;
import com.jxd.model.Meal;
import com.jxd.service.IMealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:13
 **/
@Service
public class MealServiceImpl implements IMealService {
    @Autowired
    private IMealDao mealDao;

    @Override
    public List<Map<String, Object>> getAllMeal(String mName) {
        return mealDao.getAllMeal(mName);
    }

    @Override
    public List<Map<String, Object>> getMealByPage(String mName, int pageIndex, int pageSize) {
        int PageIndex = (pageIndex-1)*pageSize;
        return mealDao.getMealByPage(mName,PageIndex,pageSize);
    }

    @Override
    public boolean addMeal(String mName, double univalent) {
        return mealDao.addMeal(mName,univalent);
    }

    @Override
    public boolean updMeal(Meal meal) {
        return mealDao.updMeal(meal);
    }

    @Override
    public boolean delMeal(int mId) {
        return mealDao.delMeal(mId);
    }
}
