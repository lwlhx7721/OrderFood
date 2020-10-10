package com.jxd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-10 08:43
 **/
@Controller
public class LoginController {
    @RequestMapping("/login")
    @ResponseBody
    public String login(String username, String pwd, Model model) {
        return "false";
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
}
