package com.jxd.controller;

import com.jxd.model.Meal;
import com.jxd.model.PageList;
import com.jxd.service.IMealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-9-25 09:19
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

    @RequestMapping("updMeal")
    public String updMeal(String mId,String mName,String univalent, Model model) {
        int id = mId == null ? 0:Integer.parseInt(mId);
        Meal meal = new Meal(id,mName,Double.parseDouble(univalent));
        model.addAttribute("meal",meal);
        return "updMeal";
    }

    @RequestMapping("updMeals")
    @ResponseBody
    public boolean updMeals(Meal meal) {
        return mealService.updMeal(meal);
    }

    @RequestMapping(value = "delMealById",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String delMealById(String mId) {
        int id = mId == null ? 0:Integer.parseInt(mId);
        if(mealService.delMeal(id)) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }
}
