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

}
