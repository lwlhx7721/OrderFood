package com.jxd.controller;

import com.jxd.model.Dept;
import com.jxd.model.PageList;
import com.jxd.service.IDeptService;
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
public class DeptController {
    @Autowired
    private IDeptService deptService;

    @RequestMapping("/getDeptList")
    @ResponseBody
    public Object getDept(String dName, int limit, int page) {
        String name = dName == null ? "": dName;
        int size = deptService.getAllDept(name).size();
        PageList pageList = new PageList(deptService.getDeptByPage(name,page,limit),size);
        return pageList;
    }

    @RequestMapping("addDept")
    public String addDept() {
        return "addDept";
    }
    @RequestMapping("toAddDepts")
    @ResponseBody
    public boolean addDepts(String dName) {
        return deptService.addDept(dName);
    }

    @RequestMapping("updDept")
    public String updDept(String deptno,String dName, Model model) {
        int id = deptno == null ? 0:Integer.parseInt(deptno);
        Dept dept = new Dept(id,dName);
        model.addAttribute("dept",dept);
        return "updDept";
    }

    @RequestMapping("updDepts")
    @ResponseBody
    public boolean updDepts(Dept dept) {
        return deptService.updDept(dept);
    }

    @RequestMapping(value = "delDeptById",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String delDeptById(String deptno) {
        int id = deptno == null ? 0:Integer.parseInt(deptno);
        if(deptService.delDept(id)) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }
}
