package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.MD5Util;
import com.article.processing.utils.MailUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/7 21:12
 */
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
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        if (baseDao.isIdExist(user.getId())) {
            try {
                req.getRequestDispatcher("/register").forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else if (baseDao.isExist(email, phone)) {
            resp.getWriter().write("用户已存在");
        } else {
            user.setUsername(req.getParameter("username"));
            user.setNickname(req.getParameter("nickname"));
            user.setPassword(MD5Util.eccrypt(req.getParameter("password")));
            user.setPhone(phone);
            user.setEmail(email);
            user.setAddress(req.getParameter("address"));
            user.setUnit(req.getParameter("unit"));
            String v = MD5Util.eccrypt(email);
            String message = "点击下面链接激活账号，十分钟内有效，否则重新注册账号，链接只能使用一次，请尽快激活！<br/>" 
                    + "<a href=\"" + req.getRequestURL() + "/userVerification?email=" +
                    email + "&v=" + v + "\">点击验证</a>";
            try {
                MailUtil.sendMail(email, user.getUsername(), "用户验证", message);
                resp.getWriter().write("已发送验证邮件，请注意查收<br/>" +
                        "未收到邮件，<a href=\"" + req.getRequestURL() + "/resend?email=" +
                        email + "&username=" + user.getUsername() + "\">重新发送</a>");
                int result = baseDao.insert(user);
                if (result != 1) {
                    resp.getWriter().write("注册失败");
                }
            } catch (MessagingException e) {
                resp.getWriter().write("邮件发送失败");
            }
        }
    }
}
