package com.jxd.controller;

import com.jxd.model.Emp;
import com.jxd.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-9-25 08:43
 **/
@Controller
@SessionAttributes({"user"})
public class LoginController {
    @Autowired
    private IEmpService empService;

    @RequestMapping("/login")
    @ResponseBody
    public String login(String username, String pwd, Model model) {
        if(username == null || pwd == null) {
            return "false";
        }
        if("admin".equals(username) && "123".equals(pwd)) {
            return "admin";
        }
        if("sysadmin".equals(username) && "123".equals(pwd)) {
            return "sysadmin";
        }
        Emp emp = empService.getEmpByEmpno(Integer.parseInt(username));
        if(Integer.parseInt(pwd) != emp.getPwd()) {
            return "false";
        }
        System.out.println(emp.getPosition());
        if("manager".equals(emp.getPosition())) {
            model.addAttribute("user",emp);
            return "manager";
        }
        if("emp".equals(emp.getPosition())) {
            model.addAttribute("user",emp);
            return "emp";
        }
        return "false";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "login";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "admin";
    }

    @RequestMapping("/sysadmin")
    public String sysadmin() {
        return "sysadmin";
    }

    @RequestMapping("/manager")
    public String manager() {
        return "manager";
    }

    @RequestMapping("/emp")
    public String emp() {
        return "emp";
    }

    @RequestMapping("/empList")
    public String empList() {
        return "empList";
    }

    @RequestMapping("/deptList")
    public String deptList() {
        return "deptList";
    }

    @RequestMapping("/mealList")
    public String mealList() {
        return "mealList";
    }
}
