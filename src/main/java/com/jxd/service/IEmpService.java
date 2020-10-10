package com.jxd.service;

import com.jxd.model.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IEmpService {
    List<Map<String,Object>> getAllEmp(String ename, int deptno);
    List<Map<String,Object>> getEmpByPage(String eName,int deptno,int pageIndex,int pageSize);
    boolean addEmp(Emp emp);
    boolean updEmp(Emp emp);
    boolean delEmp(int empno);
    Emp getEmpByEmpno(int empno);
}
