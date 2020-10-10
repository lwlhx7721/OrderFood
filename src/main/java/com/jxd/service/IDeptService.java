package com.jxd.service;

import com.jxd.model.Dept;

import java.util.List;

public interface IDeptService {
    List<Dept> getAllDept(String dName);
    List<Dept> getDeptByPage(String dName,int pageIndex, int pageSize);

    boolean addDept(String dName);
}
