package com.article.processing.servlet;

import com.article.processing.dao.UserDao;
import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.model.User;
import com.article.processing.utils.MailUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/23 13:13
 */
@WebServlet("/root/setStatus")
public class ArticleStatusServlet extends BaseServlet<ArticleDaoImpl> {
    UserDao userDao = new UserDaoImpl();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String submit = req.getParameter("submit");
        Article article = baseDao.getById(id);
        if (article != null) {
            int result;
            switch (submit) {
                case "通过":
                    result = baseDao.updateStatus(id, 2);
                    break;
                case "未通过":
                    result = baseDao.updateStatus(id, 1);
                    break;
                default:
                    throw new RuntimeException("稿件状态错误");
            }
            if (result == 1) {
                User user = userDao.getById(article.getUserId());
                String message = "尊敬的" + user.getUsername() + "，您的稿件：" + article.getTitle() + " 的审核结果为：" + submit +
                        " <a href=\"" + req.getRequestURL().substring(0, req.getRequestURL().indexOf("/root")) + "\">点击这里登陆查看" +
                        "</a>";
                try {
                    MailUtil.sendMail(user.getEmail(), user.getUsername(), "您的稿件状态发生改变", message);
                } catch (MessagingException e) {
                    throw new RuntimeException("系统异常");
                }
                resp.getWriter().write("更新成功");
                resp.setHeader("refresh", "3;url=getIndex");
            } else {
                throw new RuntimeException("更新失败");
            }
        } else {
            throw new RuntimeException("稿件不存在");
        }
    }
}
