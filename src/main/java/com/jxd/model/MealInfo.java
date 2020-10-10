package com.jxd.model;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 08:33
 **/
public class MealInfo {
    private int oNum;
    private String aTime;
    private int aNum;
    private int mId;
    private int oType;
    private int amount;
    private double total;
    private int state;
    private String remarks;

    public MealInfo() {
    }

    public MealInfo(int oNum, String aTime, int aNum, int mId, int oType, int amount, double total, int state, String remarks) {
        this.oNum = oNum;
        this.aTime = aTime;
        this.aNum = aNum;
        this.mId = mId;
        this.oType = oType;
        this.amount = amount;
        this.total = total;
        this.state = state;
        this.remarks = remarks;
    }

    public MealInfo(String aTime, int aNum, int mId, int oType, int amount, double total, int state, String remarks) {
        this.aTime = aTime;
        this.aNum = aNum;
        this.mId = mId;
        this.oType = oType;
        this.amount = amount;
        this.total = total;
        this.state = state;
        this.remarks = remarks;
    }

    public int getoNum() {
        return oNum;
    }

    public void setoNum(int oNum) {
        this.oNum = oNum;
    }

    public String getaTime() {
        return aTime;
    }

    public void setaTime(String aTime) {
        this.aTime = aTime;
    }

    public int getaNum() {
        return aNum;
    }

    public void setaNum(int aNum) {
        this.aNum = aNum;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public int getoType() {
        return oType;
    }

    public void setoType(int oType) {
        this.oType = oType;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
