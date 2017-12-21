package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;
import com.article.processing.utils.StringUtil;

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
        String phoneOrEmail = StringUtil.validator(req.getParameter("phoneOrEmail"));
        String password = MD5Util.encrypt(StringUtil.validator(req.getParameter("password")));
        User user;
        if (phoneOrEmail.matches("^1[0-9]{10}$")) {
            user = baseDao.getUserByPhone(phoneOrEmail);
        } else if (phoneOrEmail.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            user = baseDao.getUserByEmail(phoneOrEmail);
        } else {
            throw new RuntimeException("用户名格式错误");
        }
        if (user == null) {
            throw new RuntimeException("用户不存在");
        } else if (!user.getPassword().equals(password)) {
            throw new RuntimeException("密码错误");
        } else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/admin/getIndex");
        }
    }
}
