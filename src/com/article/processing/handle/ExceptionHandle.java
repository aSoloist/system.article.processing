package com.article.processing.handle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/21 16:35
 */
@WebServlet("/exceptionHandle")
public class ExceptionHandle extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String errorMessage = (String) req.getAttribute("javax.servlet.error.message");
        req.getRequestDispatcher("/WEB-INF/error-500.jsp?message=" + errorMessage).forward(req, resp);
    }
}
