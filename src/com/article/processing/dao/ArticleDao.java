package com.article.processing.dao;

import com.article.processing.model.Article;

import java.util.List;

/**
 * 稿件数据访问层接口
 * Created by Soloist on 2017/12/4 19:54
 */
public interface ArticleDao extends BaseDao<Article> {
    
    Article getByTitleOrComment(String message);
    
    List<Article> getByUser(String userId);
    
}
