package com.jxd.controller;

import com.jxd.model.PageList;
import com.jxd.service.IMealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:19
 **/
@Controller
public class MealController {
    @Autowired
    private IMealService mealService;
    @RequestMapping("getMealList")
    @ResponseBody
    public PageList getMealList(String mName,String limit,String page){
        int pageIndex=page==null ? 0:Integer.parseInt(page);
        int pageSize=limit==null ? 0:Integer.parseInt(limit);
        String name = mName == null ? "" : mName;
        int count=mealService.getAllMeal(name).size();
        PageList pageList =new PageList(mealService.getMealByPage(name,pageIndex,pageSize),count);
        return pageList;
    }

    @RequestMapping("addMeal")
    public String addMeal() {
        return "addMeal";
    }
    @RequestMapping("toAddMeal")
    @ResponseBody
    public boolean addMeal(String mName,String univalent) {
        double univalent1 = univalent==null ? 0:Double.parseDouble(univalent);
        return mealService.addMeal(mName,univalent1);
    }
}
