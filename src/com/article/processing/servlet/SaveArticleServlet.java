package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.model.Pagination;
import com.article.processing.model.User;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
            String title = StringUtil.validator(req.getParameter("title"));
            String content = StringUtil.validator(req.getParameter("content"));
            if (title.length() >= 1 && title.length() <= 30 && content.length() >= 10) {
                String userId = user.getId();
                article.setTitle(title);
                article.setUserId(userId);
                article.setContent(content);
                int result = baseDao.insert(article);
                if (result == 1) {
                    Pagination pagination = (Pagination) req.getSession().getAttribute("articles");
                    List<Article> list = baseDao.getByUser(userId);
                    pagination.setData(list);
                    pagination.setCount(list.size());
                    req.getSession().removeAttribute("articles");
                    req.getSession().setAttribute("articles", pagination);
                    resp.sendRedirect("/admin/submitArticle.jsp?key=1");
                } else {
                    throw new RuntimeException("提交失败");
                }
            }
        } else {
            throw new RuntimeException("请先登录");
        }
    }
}
