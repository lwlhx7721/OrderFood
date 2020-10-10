package com.jxd.dao;

import com.jxd.model.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDeptDao {
    List<Dept> getAllDept(String dName);
    List<Dept> getDeptByPage(@Param("dName") String dName, @Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
    boolean addDept(String dName);
    boolean updDept(String dName);
    boolean delDept(int deptno);
}
