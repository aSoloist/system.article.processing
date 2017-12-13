package com.article.processing.servlet;

import com.article.processing.utils.MD5Util;
import com.article.processing.utils.MailUtil;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/13 23:31
 */
public class ResendServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        String v = MD5Util.eccrypt(email);
        String username = req.getParameter("username");
        String message = "点击下面链接激活账号，2小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！<br/>"
                + "<a href=\"" + req.getRequestURL() + "/userVerification?email=" +
                email + "&v=" + v + "\">点击验证</a>";
        try {
            MailUtil.sendMail(email, username, "用户验证", message);
            resp.getWriter().write("已发送验证邮件，请注意查收");
        } catch (MessagingException e) {
            resp.getWriter().write("发送失败");
        }
    }
}
