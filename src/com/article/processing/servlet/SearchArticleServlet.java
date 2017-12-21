package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/12 23:30
 */
@WebServlet("/searchArticle")
public class SearchArticleServlet extends BaseServlet<ArticleDaoImpl> {

    /**
     * 条件获取稿件
     * param title
     * method GET
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String title = req.getParameter("title");
        List<Article> list = baseDao.getByTitle(user.getId(), title);
        req.setAttribute("articles", list);
        req.getRequestDispatcher("/admin/my-manuscript.jsp").forward(req, resp);
    }
}
