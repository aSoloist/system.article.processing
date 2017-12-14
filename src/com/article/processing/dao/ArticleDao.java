package com.article.processing.dao;

import com.article.processing.model.Article;

import java.util.List;

/**
 * 稿件数据访问层接口
 * Created by Soloist on 2017/12/4 19:54
 */
public interface ArticleDao extends BaseDao<Article> {
    
    List<Article> getByTitle(String userId, String title);
    
    List<Article> getByUser(String userId);
    
    boolean isIdExist(String id, String group);
}
