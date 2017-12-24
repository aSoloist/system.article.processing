package com.article.processing.servlet;

import com.article.processing.dao.impl.UserDaoImpl;
import com.article.processing.model.User;
import com.article.processing.utils.StringUtil;

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
            String username = StringUtil.validator(req.getParameter("username"));
            String nickname = StringUtil.validator(req.getParameter("nickname"));
            String address = StringUtil.validator(req.getParameter("address"));
            String unit = StringUtil.validator(req.getParameter("unit"));
            
            if (username.matches("^[\\u4e00-\\u9fa5]{2,4}$") && nickname.matches("^[\\u4e00-\\u9fa5a-zA-Z0-9_]{3,}$")
                    && address.matches("^[\\u4e00-\\u9fa5]{6,}$") && unit.matches("^[\\u4e00-\\u9fa5]+$")) {
                user.setUsername(username);
                user.setNickname(nickname);
                user.setAddress(address);
                user.setUnit(unit);
                int reuslt = baseDao.update(user);
                if (reuslt == 1) {
                    req.getSession().removeAttribute("user");
                    req.getSession().setAttribute("user", user);
                    resp.sendRedirect("/admin/personalInfo.jsp?key=1");
                } else {
                    throw new RuntimeException("保存失败");
                }
            } else {
                throw new RuntimeException("输入格式错误");
            }
        } else {
            resp.getWriter().write("请先登陆");
            resp.setHeader("refresh", "3;url=../signIn.jsp");
        }
    }
}
