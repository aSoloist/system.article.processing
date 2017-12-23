package com.article.processing.servlet;

import com.article.processing.dao.impl.MessageDaoImpl;
import com.article.processing.model.Message;
import com.article.processing.model.Pagination;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/23 18:42
 */
@WebServlet("/root/deleteMessage")
public class DeleteMessageServlet extends BaseServlet<MessageDaoImpl> {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = StringUtil.validator(req.getParameter("id"));
        if (baseDao.isIdExist(id)) {
            int result = baseDao.delete(id);
            if (result == 1) {
                List<Message> list = baseDao.getAll();
                Pagination<Message> messages = new Pagination<>();
                messages.setCount(list.size());
                messages.setData(list);
                req.getSession().removeAttribute("messages");
                req.getSession().setAttribute("messages", messages);
                resp.sendRedirect("all-message.jsp");
            } else {
                throw new RuntimeException("删除失败");
            }
        } else {
            throw new RuntimeException("公告不存在");
        }
    }
}
