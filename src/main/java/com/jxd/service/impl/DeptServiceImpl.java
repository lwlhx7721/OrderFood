package com.jxd.service.impl;

import com.jxd.dao.IDeptDao;
import com.jxd.model.Dept;
import com.jxd.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:12
 **/
@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
    private IDeptDao deptDao;

    @Override
    public List<Dept> getAllDept(String dName) {
        return deptDao.getAllDept(dName);
    }

    @Override
    public List<Dept> getDeptByPage(String dName, int pageIndex, int pageSize) {
        int PageIndex = (pageIndex - 1 ) * pageSize;
        return deptDao.getDeptByPage(dName, PageIndex, pageSize);
    }

    @Override
    public boolean addDept(String dName) {
        return deptDao.addDept(dName);
    }
}
