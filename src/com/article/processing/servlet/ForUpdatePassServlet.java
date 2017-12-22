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
 * Created by Soloist on 2017/12/23 0:30
 */
@WebServlet("/forUpdatePass")
public class ForUpdatePassServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = StringUtil.validator(req.getParameter("email"));
        if (email.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            User user = baseDao.getUserByEmail(email);
            String password = StringUtil.validator(req.getParameter("password"));
            String password2 = StringUtil.validator(req.getParameter("password2"));
            if (password.matches("^[a-zA-Z0-9_]{6,16}$") && password2.matches("^[a-zA-Z0-9_]{6,16}$")
                    && password.equals(password2)) {
                user.setPassword(MD5Util.encrypt(password));
                int result = baseDao.update(user);
                if (result == 1) {
                    resp.getWriter().write("修改成功");
                    resp.setHeader("refresh", "3;url=signin.jsp");
                } else {
                    throw new RuntimeException("修改失败");
                }
            } else {
                throw new RuntimeException("密码验证失败");
            }
        } else {
            throw new RuntimeException("邮箱格式错误");
        }
    }
}
