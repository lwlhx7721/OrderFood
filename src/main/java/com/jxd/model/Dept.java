package com.jxd.model;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 08:32
 **/
public class Dept {
    private int deptno;
    private String dName;

    public Dept() {
    }

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public Dept(int deptno, String dName) {
        this.deptno = deptno;
        this.dName = dName;
    }
}
