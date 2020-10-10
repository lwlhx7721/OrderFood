package com.jxd.model;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 08:33
 **/
public class Meal {
    private int mId;
    private String mName;
    private double univalent;

    public Meal() {
    }

    public Meal(int mId, String mName, double univalent) {
        this.mId = mId;
        this.mName = mName;
        this.univalent = univalent;
    }

    public Meal(String mName, double univalent) {
        this.mName = mName;
        this.univalent = univalent;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public double getUnivalent() {
        return univalent;
    }

    public void setUnivalent(double univalent) {
        this.univalent = univalent;
    }
}
