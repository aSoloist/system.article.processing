package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/12 23:30
 */
public class SearchArticleServlet extends BaseServlet<ArticleDaoImpl> {

    /**
     * 条件获取稿件
     * param message
     * method GET
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        List<Article> list = baseDao.getByTitleOrComment(message);
        req.setAttribute("articles", list);
        req.getRequestDispatcher("ArticleShow.jsp").forward(req, resp);
    }
}
