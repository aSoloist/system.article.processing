package com.article.processing.servlet;

import com.article.processing.dao.impl.MessageDaoImpl;
import com.article.processing.model.Message;
import com.article.processing.model.Pagination;
import com.article.processing.model.User;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/23 19:21
 */
@WebServlet("/root/saveMessage")
public class SaveMessageServlet extends BaseServlet<MessageDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String id = req.getParameter("id");
        String title = StringUtil.validator(req.getParameter("title"));
        String content = StringUtil.validator(req.getParameter("content"));
        if (id != null && !id.equals("")) {
            if (baseDao.isIdExist(id)) {
                Message message = baseDao.getById(id);
                message.setTitle(title);
                message.setMessageContent(content);
                message.setSendId(user.getId());
                int result = baseDao.update(message);
                if (result == 1) {
                    List<Message> list = baseDao.getAll();
                    Pagination<Message> messages = new Pagination<>();
                    messages.setCount(list.size());
                    messages.setData(list);
                    req.getSession().removeAttribute("messages");
                    req.getSession().setAttribute("messages", messages);
                    resp.sendRedirect("all-message.jsp");
                } else {
                    throw new RuntimeException("发布失败");
                }
            } else {
                throw new RuntimeException("稿件不存在");
            }
        } else {
            Message message = new Message();
            message.setTitle(title);
            message.setMessageContent(content);
            message.setSendId(user.getId());
            int result = baseDao.insert(message);
            if (result == 1) {
                List<Message> list = baseDao.getAll();
                Pagination<Message> messages = new Pagination<>();
                messages.setCount(list.size());
                messages.setData(list);
                req.getSession().removeAttribute("messages");
                req.getSession().setAttribute("messages", messages);
                resp.sendRedirect("all-message.jsp");
            } else {
                throw new RuntimeException("发布失败");
            }
        }
    }
}
