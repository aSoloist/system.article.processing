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
 * Created by Soloist on 2017/12/23 17:17
 */
@WebServlet("/admin/updateArticle")
public class UpdateArticleServlet extends BaseServlet<ArticleDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String id = StringUtil.validator(req.getParameter("id"));
        Article article = baseDao.getById(id);
        if (article != null) {
            String title = StringUtil.validator(req.getParameter("title"));
            String content = StringUtil.validator(req.getParameter("content"));
            Article article1 = new Article();
            article1.setVer(article.getVer() + 1);
            article1.setGroup(article.getGroup());
            article1.setContent(content);
            article1.setTitle(title);
            article1.setUserId(user.getId());
            int result = baseDao.insert(article1);
            if (result == 1) {
                List<Article> list = baseDao.getByUser(user.getId());
                Pagination<Article> articles = new Pagination<>();
                articles.setData(list);
                articles.setCount(list.size());
                req.getSession().removeAttribute("articles");
                req.getSession().setAttribute("articles", articles);
                resp.sendRedirect("allArticle.jsp");
            } else {
                throw new RuntimeException("修改失败");
            }
        } else {
            throw new RuntimeException("稿件不存在");
        }
    }
}
