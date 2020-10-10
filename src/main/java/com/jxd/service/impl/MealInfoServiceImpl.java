package com.jxd.service.impl;

import com.jxd.dao.IMealInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:13
 **/
@Service
public class MealInfoServiceImpl {
    @Autowired
    private IMealInfoDao mealInfoDao;
}
