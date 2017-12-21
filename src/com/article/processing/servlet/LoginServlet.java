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
 * Created by Soloist on 2017/12/7 21:20
 */
@WebServlet("/login")
public class LoginServlet extends BaseServlet<UserDaoImpl> {

    /**
     * 用户登陆
     * param phoneOrEmail
     * param password
     * method POST
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String phoneOrEmail = StringUtil.validator(req.getParameter("phoneOrEmail"));
        String password = StringUtil.validator(req.getParameter("password"));
        password = MD5Util.encrypt(password);
        
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
