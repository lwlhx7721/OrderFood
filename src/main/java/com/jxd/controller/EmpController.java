package com.jxd.controller;

import com.jxd.model.Emp;
import com.jxd.model.PageList;
import com.jxd.service.IDeptService;
import com.jxd.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-9-25 09:18
 **/
@Controller
public class EmpController {
    /*同部门*/
    @Autowired
    private IEmpService empService;
    @Autowired
    private IDeptService deptService;

    @RequestMapping("empLists")
    public String toEmpList(Model model) {
        model.addAttribute("deptList",deptService.getAllDept(""));
        return "empList";
    }

    @RequestMapping("getEmpList")
    @ResponseBody
    public PageList getEmpList(String ename, String deptno, String page,String limit) {
        int dId = deptno == null ? 0:Integer.parseInt(deptno);
        String name = ename == null ? "":ename;
        int pageIndex = page == null ? 0:Integer.parseInt(page);
        int pageSize = limit == null ? 0:Integer.parseInt(limit);
        int count = empService.getAllEmp(name,dId).size();
        PageList pageList = new PageList(empService.getEmpByPage(name,dId,pageIndex,pageSize),count);
        return pageList;
    }

    @RequestMapping("addEmp")
    public String addEmp(Model model) {
        model.addAttribute("deptList",deptService.getAllDept(""));
        return "addEmp";
    }

    @RequestMapping("addEmpForm")
    @ResponseBody
    public boolean addEmps(Emp emp,String ename) {
        System.out.println(ename);
        return empService.addEmp(emp);
    }

    @RequestMapping(value = "delEmpById",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String delEmp(String empno) {
        int id = empno == null ? 0:Integer.parseInt(empno);
        if(empService.delEmp(id)) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    @RequestMapping("updEmp")
    public String updEmp(String empno, Model model) {
        int id = empno == null ? 0:Integer.parseInt(empno);
        Emp emp = empService.getEmpByEmpno(id);
        model.addAttribute("deptList",deptService.getAllDept(""));
        model.addAttribute("emp",emp);
        return "updEmp";
    }

    @RequestMapping("updEmpForm")
    @ResponseBody
    public boolean updEmp(Emp emp) {
        return empService.updEmp(emp);
    }

}
