package com.article.processing.dao;

import java.util.List;

/**
 * 数据访问层基类
 * Created by Soloist on 2017/12/4 19:50
 */
interface BaseDao<T> {
    
    List<T> getAll();
    
    T getById(String id);
    
    int insert(T model);
    
    int update(T model);
    
    int delete(String id);
    
    int updateStatus(String id, int status);
    
    boolean isIdExist(String id);
}
