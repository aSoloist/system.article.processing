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
 * Created by Soloist on 2017/12/23 1:05
 */
@WebServlet("/admin/allMessage")
public class AllMessageServlet extends BaseServlet<MessageDaoImpl> {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Message> list = baseDao.getAll();
        Pagination<Message> pagination = new Pagination<>();
        pagination.setData(list);
        pagination.setCount(list.size());
        req.getSession().setAttribute("messages", pagination);
        resp.sendRedirect("index.jsp");
    }
}
