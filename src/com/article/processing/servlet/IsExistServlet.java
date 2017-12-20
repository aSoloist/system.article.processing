package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/21 0:07
 */
public class IsExistServlet extends BaseServlet<UserDaoImpl> {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        boolean isExist = true;
        if (phone != null) {
            isExist = baseDao.isExist("", phone);
        } else if (email != null) {
            isExist = baseDao.isExist(email, "");
        }
        if (isExist) {
            resp.getWriter().write("fail");
        } else {
            resp.getWriter().write("success");
        }
    }
}
