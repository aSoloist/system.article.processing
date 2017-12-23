package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;
import com.article.processing.utils.StringUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Soloist on 2017/12/13 18:07
 */
@WebServlet("/register/userVerification")
public class UserVerificationServlet extends BaseServlet<UserDaoImpl> {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = StringUtil.validator(req.getParameter("email"));
        String v = StringUtil.validator(req.getParameter("v"));
        User user = baseDao.getUserByEmail(email);
        //用户是否存在
        if (user != null) {
            //用户状态
            if (user.getStatus() == 0) {
                //是否过期
                long now = new Date().getTime();
                long before = user.getCreateTime().getTime();
                if ((now - before) < 60 * 10 * 1000) {
                    String eccrypt = MD5Util.encrypt(email);
                    //验证激活码
                    if (eccrypt.equals(v)) {
                        int result = baseDao.updateStatus(user.getId(), 10);
                        if (result == 1) {
                            user.setStatus(10);
                            resp.getWriter().write("激活成功");
                            req.getSession().setAttribute("user", user);
                            resp.setHeader("refresh", "3;url=/admin/getIndex");
                        }
                    } else {
                        throw new RuntimeException("验证码错误");
                    }
                } else {
                    throw new RuntimeException("验证码已过期");
                }
            } else {
                throw new RuntimeException("邮箱已激活，请直接登陆");
            }
        } else {
            throw new RuntimeException("该邮箱未注册，可能邮箱地址不正确");
        }
    }
}
