package com.jxd.model;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 08:32
 **/
public class Emp {
    private int empno;
    private int pwd;
    private String ename;
    private String contact;
    private int sex;
    private int deptno;
    private String position;

    public Emp() {
    }

    public Emp(int empno,int pwd, String ename, String contact, int sex, int deptno, String position) {
        this.empno = empno;
        this.pwd = pwd;
        this.ename = ename;
        this.contact = contact;
        this.sex = sex;
        this.deptno = deptno;
        this.position = position;
    }

    public Emp(int pwd, String ename, String contact, int sex, int deptno, String position) {
        this.pwd = pwd;
        this.ename = ename;
        this.contact = contact;
        this.sex = sex;
        this.deptno = deptno;
        this.position = position;
    }

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public int getPwd() {
        return pwd;
    }

    public void setPwd(int pwd) {
        this.pwd = pwd;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
