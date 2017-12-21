package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/13 17:38
 */
@WebServlet("/saveArticle")
public class SaveArticleServlet extends BaseServlet<ArticleDaoImpl> {

    /**
     * 保存稿件
     * param title
     * param content
     * method POST
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Article article = new Article();
        User user = (User) req.getSession().getAttribute("user");
        if (baseDao.isIdExist(article.getId(), article.getGroup())) {
            try {
                req.getRequestDispatcher("/saveArticle").forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else if (user != null) {
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            String userId = user.getId();
            article.setTitle(title);
            article.setUserId(userId);
            article.setContent(content);
            int result = baseDao.insert(article);
            if (result == 1) {
                resp.getWriter().write("提交成功");
            } else {
                resp.getWriter().write("提交失败");
            }
        } else {
            resp.getWriter().write("请先登录");
        }
    }
}
