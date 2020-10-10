package com.jxd.service.impl;

import com.jxd.dao.IEmpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:13
 **/
@Service
public class EmpServiceImpl {
    @Autowired
    private IEmpDao empDao;
}
