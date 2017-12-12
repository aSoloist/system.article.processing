package com.article.processing.servlet;

import javax.servlet.http.HttpServlet;
import java.lang.reflect.ParameterizedType;

/**
 * Created by Soloist on 2017/12/4 20:13
 */
public abstract class BaseServlet<T> extends HttpServlet {
    T baseDao;

    {
        try {
            Class<T> clazz = (Class<T>) ((ParameterizedType) getClass()
                    .getGenericSuperclass()).getActualTypeArguments()[0];
            baseDao = clazz.newInstance();
        } catch (InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }
}
