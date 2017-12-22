package com.article.processing.servlet;

import com.article.processing.utils.MD5Util;
import com.article.processing.utils.MailUtil;
import com.article.processing.utils.StringUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/22 23:12
 */
@WebServlet("/forgetPassword/forResend")
public class ForResendServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = StringUtil.validator(req.getParameter("email"));
        if (email.matches("^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$")) {
            String v = MD5Util.encrypt2(email);
            String message = "您发出了修改密码的请求，点击下面按钮确认是您本人操作，如果不是您本人的操作，请忽略这封邮件！<br/>" +
                    "<a href=\"" + req.getRequestURL() + "/forPassVerification?email=" +
                    email + "&v=" + v + "\">点击验证</a>";
            try {
                MailUtil.sendMail(email, "", "修改密码", message);
                resp.getWriter().write("已发送验证邮件，请注意查收");
            } catch (MessagingException e) {
                resp.getWriter().write("发送失败");
            }
        }
    }
}
