package com.jxd.service.impl;

import com.jxd.dao.IMealInfoDao;
import com.jxd.model.MealInfo;
import com.jxd.service.IMealInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:13
 **/
@Service
public class MealInfoServiceImpl implements IMealInfoService {
    @Autowired
    private IMealInfoDao mealInfoDao;

    @Override
    public List<MealInfo> getAllMealInfo(int empno) {
        return mealInfoDao.getAllMealInfo(empno);
    }

    @Override
    public List<MealInfo> getAllMealInfoByPage(int empno, int pageIndex, int pageSize) {
        int PageIndex = (pageIndex-1)*pageSize;
        return mealInfoDao.getAllMealInfoByPage(empno,PageIndex,pageSize);
    }

    @Override
    public boolean updMealInfoState(int onum, int state) {
        return mealInfoDao.updMealInfoState(onum,state);
    }

    @Override
    public boolean addMealInfo(MealInfo mealInfo) {
        return mealInfoDao.addMealInfo(mealInfo);
    }

    @Override
    public List<MealInfo> getAllMealInfoByEmp(int anum) {
        return mealInfoDao.getAllMealInfoByEmp(anum);
    }

    @Override
    public List<MealInfo> getAllMealInfoByEmpAndPage(int anum, int pageIndex, int pageSize) {
        int PageIndex = (pageIndex-1)*pageSize;
        return mealInfoDao.getAllMealInfoByEmpAndPage(anum,PageIndex,pageSize);
    }
}
