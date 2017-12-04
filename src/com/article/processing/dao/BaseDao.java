package com.article.processing.dao;

import java.util.List;

/**
 * Created by Soloist on 2017/12/4 19:50
 */
interface BaseDao<T> {
    
    List<T> getAll();
    
    T getById(String id);
    
    int insert(T model);
    
    int update(T model);
    
    int delete(String id);
}
