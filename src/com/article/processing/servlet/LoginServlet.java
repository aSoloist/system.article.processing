package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/7 21:20
 */
public class LoginServlet extends BaseServlet<UserDaoImpl> {

    /**
     * 用户登陆
     * param phoneOrEmail
     * param password
     * method POST
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneOrEmail = req.getParameter("phoneOrEmail");
        String password = req.getParameter("password");
        User user = null;
        if (phoneOrEmail.matches("^1[0-9]{10}$")) {
            user = baseDao.getUserByPhoneAndPass(phoneOrEmail, password);
        } else if (phoneOrEmail.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            user = baseDao.getUSerByEmailAndPass(phoneOrEmail, password);
        } else {
            resp.getWriter().write("用户名错误");
        }
        
        if (user == null) {
            resp.getWriter().write("用户不存在");
        } else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("index.jsp");
        }
    }
}
