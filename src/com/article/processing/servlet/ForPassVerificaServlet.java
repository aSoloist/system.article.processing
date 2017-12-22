package com.article.processing.servlet;

import com.article.processing.utils.MD5Util;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/22 23:07
 */
@WebServlet("/forgetPassword/forPassVerification")
public class ForPassVerificaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = StringUtil.validator(req.getParameter("email"));
        String v = StringUtil.validator(req.getParameter("v"));
        email = MD5Util.encrypt2(email);
        if (email.equals(v)) {
            req.setAttribute("email", email);
            req.getRequestDispatcher("../update-password.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("验证失败");
        }
    }
}
