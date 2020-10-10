package com.jxd.dao;

import com.jxd.model.Dept;
import com.jxd.model.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IEmpDao {
    List<Map<String,Object>> getAllEmp(@Param("ename") String ename,@Param("deptno") int deptno);
    List<Map<String,Object>> getEmpByPage(@Param("ename") String eName,@Param("deptno") int deptno, @Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
    boolean addEmp(Emp emp);
    boolean updEmp(Emp emp);
    boolean delEmp(int empno);
    Emp getEmpByEmpno(int empno);
}
