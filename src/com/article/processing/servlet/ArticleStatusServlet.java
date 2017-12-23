package com.article.processing.servlet;

import com.article.processing.dao.impl.ArticleDaoImpl;
import com.article.processing.model.Article;
import com.article.processing.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/23 13:13
 */
@WebServlet("/root/setStatus")
public class ArticleStatusServlet extends BaseServlet<ArticleDaoImpl> {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = StringUtil.validator((String) req.getAttribute("status"));
        String id = StringUtil.validator((String) req.getAttribute("id"));
        Article article = baseDao.getById(id);
        if (article != null) {
            int result;
            switch (status) {
                case "1":
                    result = baseDao.updateStatus(id, Integer.parseInt(status));
                    break;
                case "2":
                    result = baseDao.updateStatus(id, Integer.parseInt(status));
                    break;
                default:
                    throw new RuntimeException("稿件状态错误");
            }
            if (result == 1) {
                resp.getWriter().write("更新成功");
                resp.setHeader("refresh", "3;url=getIndex");
            } else {
                throw new RuntimeException("更新失败");
            }
        } else {
            throw new RuntimeException("稿件不存在");
        }
    }
}
