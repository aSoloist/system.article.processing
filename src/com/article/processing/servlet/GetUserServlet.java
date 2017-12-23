package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.Pagination;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/23 12:12
 */
@WebServlet("/root/getUser")
public class GetUserServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> list = baseDao.getUser();
        Pagination<User> users = new Pagination<>();
        users.setData(list);
        users.setCount(list.size());
        req.getSession().setAttribute("users", users);
        resp.sendRedirect("getMessage");
    }
}
