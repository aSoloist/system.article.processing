package com.article.processing.servlet;

import com.article.processing.dao.UserDao;
import com.article.processing.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/4 20:13
 */
public class BaseServlet extends HttpServlet {
    UserDao userDao = new UserDaoImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userDao.getAll();
    }
}
