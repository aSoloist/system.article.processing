package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/7 21:12
 */
public class RegisterServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        user.setUsername(req.getParameter("username"));
        user.setNickname(req.getParameter("nickname"));
        user.setPassword(req.getParameter("password"));
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(req.getParameter("address"));
        user.setUnit(req.getParameter("unit"));
        if (baseDao.isExist(email, phone)) {
            resp.getWriter().write("用户已存在");
        } else {
            int result = baseDao.insert(user);
            if (result == 1) {
                resp.getWriter().write("注册成功");
            } else {
                resp.getWriter().write("注册失败");
            }
        }
    }
}
