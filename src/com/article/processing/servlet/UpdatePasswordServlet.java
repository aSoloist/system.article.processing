package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/20 21:27
 */
@WebServlet("/updatePassword")
public class UpdatePasswordServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.getWriter().write("请先登录");
            resp.setHeader("refresh", "3;url=../signIn.jsp");
        } else {
            String oldPassword = req.getParameter("oldPassword");
            String password = req.getParameter("password");
            if (oldPassword.length() >= 6 && oldPassword.length() <= 16 
                    && password.length() <= 16 && password.length() >= 6) {
                oldPassword = MD5Util.encrypt(StringUtil.validator(req.getParameter("oldPassword")));
                if (user.getPassword().equals(oldPassword)) {
                    password = MD5Util.encrypt(StringUtil.validator(req.getParameter("password")));
                    user.setPassword(password);
                    int result = baseDao.update(user);
                    if (result == 1) {
                        req.getSession().removeAttribute("user");
                        req.getSession().setAttribute("user", user);
                        resp.sendRedirect("/admin/modifyPassword.jsp?key=1");
                    } else {
                        throw new RuntimeException("修改失败");
                    }
                } else {
                    throw new RuntimeException("密码验证失败");
                }
            } else {
                throw new RuntimeException("密码长度错误");
            }
        }
    }
}
