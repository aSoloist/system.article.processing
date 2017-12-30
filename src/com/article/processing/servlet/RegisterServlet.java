package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;
import com.article.processing.utils.MailUtil;
import com.article.processing.utils.StringUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/7 21:12
 */
@WebServlet("/register")
public class RegisterServlet extends BaseServlet<UserDaoImpl> {

    /**
     * 用户注册
     * param username
     * param nickname
     * param password
     * param phone
     * param email
     * param address
     * param unit
     * method POST
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = new User();
        String email = StringUtil.validator(req.getParameter("email"));
        String phone = StringUtil.validator(req.getParameter("phone"));
        if (email.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$") || 
                phone.matches("^1[0-9]{10}$")) {
            throw new RuntimeException("邮箱或手机号格式错误");
        }
        if (baseDao.isIdExist(user.getId())) {
            try {
                req.getRequestDispatcher("/register").forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else if (baseDao.isExist(email, phone)) {
            throw new RuntimeException("用户已存在");
        } else {
            user.setUsername(StringUtil.validator(req.getParameter("username")));
            user.setNickname(StringUtil.validator(req.getParameter("nickname")));
            user.setPassword(MD5Util.encrypt(StringUtil.validator(req.getParameter("password"))));
            user.setPhone(phone);
            user.setEmail(email);
            user.setAddress(StringUtil.validator(req.getParameter("address")));
            user.setUnit(StringUtil.validator(req.getParameter("unit")));
            String v = MD5Util.encrypt(email);
            String message = "点击下面链接激活账号，十分钟内有效，否则重新注册账号，链接只能使用一次，请尽快激活！<br/>" 
                    + "<a href=\"" + req.getRequestURL() + "/userVerification?email=" +
                    email + "&v=" + v + "\">点击验证</a>";
            try {
                MailUtil.sendMail(email, user.getUsername(), "用户验证", message);
                resp.getWriter().write("已发送验证邮件，十分钟内有效，请注意查收<br/>" +
                        "未收到邮件，<a href=\"" + req.getRequestURL() + "/resend?email=" +
                        email + "&username=" + user.getUsername() + "\">重新发送</a>");
                int result = baseDao.insert(user);
                if (result != 1) {
                    throw new RuntimeException("注册失败");
                }
            } catch (MessagingException e) {
                throw new RuntimeException("邮件发送失败");
            }
        }
    }
}
