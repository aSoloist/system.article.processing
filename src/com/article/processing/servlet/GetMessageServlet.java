package com.article.processing.servlet;

import com.article.processing.dao.impl.MessageDaoImpl;
import com.article.processing.model.Message;
import com.article.processing.model.Pagination;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Soloist on 2017/12/23 12:33
 */
@WebServlet("/root/getMessage")
public class GetMessageServlet extends BaseServlet<MessageDaoImpl> {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Message> list = baseDao.getAll();
        Pagination<Message> messages = new Pagination<>();
        messages.setCount(list.size());
        messages.setData(list);
        req.getSession().setAttribute("messages", messages);
        resp.sendRedirect("index.jsp");
    }
}
