package com.article.processing.dao.impl;

import com.article.processing.dao.ArticleDao;
import com.article.processing.model.Article;

import java.util.List;

/**
 * 稿件数据访问层实现
 * Created by Soloist on 2017/12/4 19:54
 */
public class ArticleDaoImpl implements ArticleDao {
    @Override
    public List<Article> getAll() {
        return null;
    }

    @Override
    public Article getById(String id) {
        return null;
    }

    @Override
    public int insert(Article model) {
        return 0;
    }

    @Override
    public int update(Article model) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    @Override
    public int updateStatus(String id, int status) {
        return 0;
    }

    @Override
    public boolean isIdExist(String id) {
        return false;
    }

    @Override
    public List<Article> getByTitleOrComment(String message) {
        return null;
    }

    @Override
    public List<Article> getByUser(String userId) {
        return null;
    }

    @Override
    public boolean isIdExist(String id, String group) {
        return false;
    }
}
