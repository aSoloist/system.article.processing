package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/20 21:20
 */
@WebServlet("/updateUser")
public class UpdateUserServlet extends BaseServlet<UserDaoImpl> {

    /**
     * 更新用户信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            String username = req.getParameter("username");
            if (username != null && !"".equals(username)) {
                username = username.trim();
                user.setUsername(username);
            }
            String nickname = req.getParameter("nickname");
            if (nickname != null && !"".equals(nickname)) {
                nickname = nickname.trim();
                user.setNickname(nickname);
            }
            String address = req.getParameter("address");
            if (address != null && !"".equals(address)) {
                address = address.trim();
                user.setAddress(address);
            }
            String unit = req.getParameter("unit");
            if (unit != null && !"".equals(unit)) {
                unit = unit.trim();
                user.setUnit(unit);
            }
            
            int reuslt = baseDao.update(user);
            if (reuslt == 1) {
                req.getSession().removeAttribute("user");
                req.getSession().setAttribute("user", user);
                resp.getWriter().write("success");
            } else {
                resp.getWriter().write("fail");               
            }
        } else {
            resp.getWriter().write("请先登陆");
            resp.setHeader("refresh", "3;url=../signin.jsp");
        }
    }
}
