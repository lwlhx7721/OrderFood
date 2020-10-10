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
        return empDao.getAllEmp(ename,deptno);
    }

    @Override
    public List<Map<String, Object>> getEmpByPage(String eName, int deptno, int pageIndex, int pageSize) {
        int index = (pageIndex - 1) * pageSize;
        return empDao.getEmpByPage(eName,deptno,index,pageSize);
    }

    @Override
    public boolean addEmp(Emp emp) {
        return empDao.addEmp(emp);
    }

    @Override
    public boolean updEmp(Emp emp) {
        return empDao.updEmp(emp);
    }

    @Override
    public boolean delEmp(int empno) {
        return empDao.delEmp(empno);
    }

    @Override
    public Emp getEmpByEmpno(int empno) {
        return empDao.getEmpByEmpno(empno);
    }
}
