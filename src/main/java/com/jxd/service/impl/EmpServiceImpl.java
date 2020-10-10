package com.jxd.service.impl;

import com.jxd.dao.IEmpDao;
import com.jxd.model.Emp;
import com.jxd.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 09:13
 **/
@Service
public class EmpServiceImpl implements IEmpService {
    @Autowired
    private IEmpDao empDao;

    @Override
    public List<Map<String, Object>> getAllEmp(String ename, int deptno) {
        return null;
    }

    @Override
    public List<Map<String, Object>> getEmpByPage(String eName, int deptno, int pageIndex, int pageSize) {
        return null;
    }

    @Override
    public boolean addEmp(Emp emp) {
        return false;
    }

    @Override
    public boolean updEmp(Emp emp) {
        return false;
    }

    @Override
    public boolean delEmp(int empno) {
        return false;
    }

    @Override
    public Emp getEmpByEmpno(int empno) {
        return null;
    }
}
