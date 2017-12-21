package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/18 17:53
 */
@WebServlet("/admin-login")
public class AdminLoginServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String phoneOrEmail = req.getParameter("phoneOrEmail");
        String password = MD5Util.encrypt(req.getParameter("password"));
        User user = null;
        if (phoneOrEmail.matches("^1[0-9]{10}$")) {
            user = baseDao.getUserByPhoneAndPass(phoneOrEmail, password);
        } else if (phoneOrEmail.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            user = baseDao.getUserByEmailAndPass(phoneOrEmail, password);
        } else {
            resp.getWriter().write("用户名错误");
        }

        if (user == null || user.getStatus() <= 10) {
            resp.getWriter().write("用户不存在");
        } else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/admin/index.jsp");
        }
    }
}
