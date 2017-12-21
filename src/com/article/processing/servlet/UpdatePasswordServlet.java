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
            resp.setHeader("refresh", "3;url=../signin.jsp");
        } else {
            String oldPassword = MD5Util.encrypt(StringUtil.validator(req.getParameter("oldPassword")));
            if (user.getPassword().equals(oldPassword)) {
                String password = MD5Util.encrypt(StringUtil.validator(req.getParameter("password")));
                user.setPassword(password);
                int result = baseDao.update(user);
                if (result == 1) {
                    req.getSession().removeAttribute("user");
                    req.getSession().setAttribute("user", user);
                    resp.getWriter().write("success");
                } else {
                    resp.getWriter().write("fail");
                }
            } else {
                throw new RuntimeException("密码验证失败");
            }
        }
    }
}
