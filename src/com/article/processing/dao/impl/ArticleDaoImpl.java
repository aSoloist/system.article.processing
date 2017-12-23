package com.article.processing.dao.impl;

import com.article.processing.dao.ArticleDao;
import com.article.processing.model.Article;
import com.article.processing.utils.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 稿件数据访问层实现
 * Created by Soloist on 2017/12/4 19:54
 */
public class ArticleDaoImpl implements ArticleDao {

    private void createArticle(Article article, ResultSet resultSet) {
        try {
            article.setId(resultSet.getString("id"));
            article.setUserId(resultSet.getString("user_id"));
            article.setTitle(resultSet.getString("title"));
            article.setContent(resultSet.getString("content"));
            article.setGroup(resultSet.getString("article_group"));
            article.setStatus(resultSet.getInt("status"));
            article.setCreateTime(resultSet.getTimestamp("create_time"));
            article.setVer(resultSet.getInt("ver"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取所有稿件（不含历史稿件）
     * @return
     */
    public List<Article> getAll() {
        String sql = "SELECT * FROM article a where status <> -1 and id = " +
                "(select id from article where a.article_group = article_group order by create_time desc limit 1)" +
                " order by create_time desc";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        List<Article> list = new ArrayList<>();
        Article article;
        ResultSet resultSet = null;
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                article = new Article();
                createArticle(article, resultSet);
                list.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return list;
    }

    /**
     * 通过稿件ID获取稿件
     * @param id 稿件ID
     * @return 稿件
     */
    public Article getById(String id) {
        String sql = "select * from article where status <> -1 and id = ? order by create_time desc limit 1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        Article article = null;
        try {
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                article = new Article();
                createArticle(article, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return article;
    }

    /**
     * 保存稿件
     * @param model 稿件类
     * @return 更新结果
     */
    public int insert(Article model) {
        String sql = "insert into article (id, title, content, user_id, create_time, article_group, status, ver) values (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        int result = 0;
        try {
            preparedStatement.setString(1, model.getId());
            preparedStatement.setString(2, model.getTitle());
            preparedStatement.setString(3, model.getContent());
            preparedStatement.setString(4, model.getUserId());
            preparedStatement.setTimestamp(5, model.getCreateTime());
            preparedStatement.setString(6, model.getGroup());
            preparedStatement.setInt(7, model.getStatus());
            preparedStatement.setInt(8, model.getVer());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 更新稿件，执行插入
     * @param model 稿件类
     * @return 更新结果
     */
    public int update(Article model) {
        return insert(model);
    }

    /**
     * 删除稿件
     * @param id 稿件ID
     * @return 更新结果
     */
    public int delete(String id) {
        return updateStatus(id, -1);
    }

    /**
     * 更新稿件状态
     * @param id 稿件ID
     * @param status 0.默认  （未查看） 1.退稿 2.录用 3.修改后再审 -1.删除
     * @return
     */
    public int updateStatus(String id, int status) {
        String sql = "update article set status = ? where id = ?";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        int result = 0;
        try {
            preparedStatement.setInt(1, status);
            preparedStatement.setString(2, id);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 判断稿件是否存在
     * @param id 稿件ID
     * @return true 存在; false 不存在
     */
    public boolean isIdExist(String id) {
        return getById(id) != null;
    }

    /**
     * 通过作者id与搜索信息获取稿件
     * @param userId 作者ID
     * @param title 搜索信息
     * @return 稿件的集合
     */
    public List<Article> getByTitle(String userId, String title) {
        String sql = "select * from article a where status <> -1 and user_id = ? and title like ? and id = " +
                "(select id from article where a.article_group = article_group order by create_time desc limit 1)";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        List<Article> list = new ArrayList<>();
        Article article;
        try {
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, "%" + title + "%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                article = new Article();
                createArticle(article, resultSet);
                list.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return list;
    }

    /**
     * 通过用户ID获取稿件
     * @param userId 用户id
     * @return 稿件集合
     */
    public List<Article> getByUser(String userId) {
        String sql = "select * from article a where status <> -1 and user_id = ? and id = " +
                "(select id from article where a.article_group = article_group order by create_time desc limit 1) order by create_time desc";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        List<Article> list = new ArrayList<>();
        Article article;
        try {
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                article = new Article();
                createArticle(article, resultSet);
                list.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return list;
    }

    /**
     * 判断稿件是否存在
     * @param id 稿件ID
     * @return true 存在; false 不存在
     */
    public boolean isIdExist(String id, String group) {
        String sql = "select * from article where status <> -1 and id = ? and article_group = ?";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        boolean isExist = true;
        ResultSet resultSet = null;
        try {
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, group);
            resultSet = preparedStatement.executeQuery();
            isExist = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return isExist;
    }
}
