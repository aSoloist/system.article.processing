package com.article.processing.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页类
 * Created by Soloist on 2017/12/4 21:34
 */
public class Pagination<T> implements Serializable {
    
    private Integer totalPage = 0;
    
    private Integer page = 1;
    
    private Integer count = 0;
    
    private Integer rows = 15;
    
    private List<T> data = new ArrayList<>();

    public Integer getPage() {
        this.getTotalPage();
        return this.page > this.totalPage ? this.totalPage : this.page;
    }

    public void setPage(Integer page) {
        if (page != null && page >= 1) {
            this.page = page;
        } else {
            this.page = 1;
        }

    }

    public Integer getTotalPage() {
        if (this.count < 1) {
            return 1;
        } else {
            this.totalPage = this.count / this.rows;
            if (this.count % this.rows > 0) {
                this.totalPage = this.totalPage + 1;
            }

            return this.totalPage;
        }
    }

    public Integer getCount() {
        return this.count;
    }

    public void setCount(Integer count) {
        if (count != null && count >= 0) {
            this.count = count;
        } else {
            this.count = 0;
        }

    }

    public Integer getRows() {
        return this.rows;
    }

    public void setRows(Integer rows) {
        if (rows != null && rows > 0) {
            this.rows = rows;
        } else {
            this.rows = 20;
        }

    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Integer getStartIdx() {
        return this.rows * this.page - this.rows;
    }
}