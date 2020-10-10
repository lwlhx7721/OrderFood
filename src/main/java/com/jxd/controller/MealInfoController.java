package com.jxd.controller;

import com.jxd.model.Emp;
import com.jxd.model.MealInfo;
import com.jxd.model.PageList;
import com.jxd.service.IDeptService;
import com.jxd.service.IMealInfoService;
import com.jxd.service.IMealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-9-25 09:19
 **/
@Controller
public class MealInfoController {
    @Autowired
    private IMealInfoService mealInfoService;
    @Autowired
    private IDeptService deptService;
    @Autowired
    private IMealService mealService;

    @RequestMapping("MIsys")
    public String MIsys(Model model) {
        model.addAttribute("deptList",deptService.getAllDept(""));
        return "MIsys";
    }

    @RequestMapping("getMIsys")
    @ResponseBody
    public PageList getMIsys(String deptno, String page, String limit) {
        int dId = deptno == null ? 0:Integer.parseInt(deptno);
        int pageIndex = page == null ? 0:Integer.parseInt(page);
        int pageSize = limit == null ? 0:Integer.parseInt(limit);
        int count = mealInfoService.getAllMealInfo(dId).size();
        PageList pageList = new PageList(mealInfoService.getAllMealInfoByPage(dId,pageIndex,pageSize),count);
        return pageList;
    }

    @RequestMapping("MImanager")
    public String MImanager(Model model) {
        return "MImanager";
    }

    @RequestMapping("getMImanager")
    @ResponseBody
    public PageList getMImanager(String page, String limit, HttpServletRequest request) {
        int dId = ((Emp)request.getSession().getAttribute("user")).getDeptno();
        int pageIndex = page == null ? 0:Integer.parseInt(page);
        int pageSize = limit == null ? 0:Integer.parseInt(limit);
        int count = mealInfoService.getAllMealInfo(dId).size();
        PageList pageList = new PageList(mealInfoService.getAllMealInfoByPage(dId,pageIndex,pageSize),count);
        return pageList;
    }

    @RequestMapping("MIemp")
    public String MIemp(Model model) {
        return "MIemp";
    }

    @RequestMapping("MIemp")
    @ResponseBody
    public PageList MIemp(String page, String limit, HttpServletRequest request) {
        int dId = ((Emp)request.getSession().getAttribute("user")).getEmpno();
        int pageIndex = page == null ? 0:Integer.parseInt(page);
        int pageSize = limit == null ? 0:Integer.parseInt(limit);
        int count = mealInfoService.getAllMealInfoByEmp(dId).size();
        PageList pageList = new PageList(mealInfoService.getAllMealInfoByEmpAndPage(dId,pageIndex,pageSize),count);
        return pageList;
    }

    @RequestMapping(value = "updMI",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updMI(String oNum,int state) {
        if(mealInfoService.updMealInfoState(Integer.parseInt(oNum),state)) {
            return "确认成功";
        } else {
            return "确认失败";
        }
    }

    @RequestMapping("addMealInfo")
    public String addMI(Model model) {
        model.addAttribute("mealList",mealService.getAllMeal(""));
        return "addMealInfo";
    }

    @RequestMapping("addMIs")
    @ResponseBody
    public boolean addMIs(MealInfo mealInfo) {
        return mealInfoService.addMealInfo(mealInfo);
    }
}
