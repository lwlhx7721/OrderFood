package com.jxd.model;

import java.util.List;

/**
 * @program: OrderFood
 * @description:
 * @author: WMR
 * @create: 2020-10-09 12:32
 **/
public class PageList {
    private List list;
    private int count;

    public PageList() {
    }

    public PageList(List list, int count) {
        this.list = list;
        this.count = count;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
