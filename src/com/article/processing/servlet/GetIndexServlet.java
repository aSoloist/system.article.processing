package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.model.Pagination;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/21 20:31
 */
@WebServlet("/admin/getIndex")
public class GetIndexServlet extends BaseServlet<ArticleDaoImpl> {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Article> list = baseDao.getByUser(user.getId());
        Pagination<Article> pagination = new Pagination<>();
        pagination.setCount(list.size());
        pagination.setData(list);
        session.setAttribute("articles", pagination);
        resp.sendRedirect("allMessage");
    }
}
