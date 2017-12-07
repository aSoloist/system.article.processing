package com.article.processing.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Soloist on 2017/12/7 22:12
 */
public class EncodeFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        filterChain.doFilter(servletRequest, response);
    }

    @Override
    public void destroy() {
    }
}
