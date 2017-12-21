package com.article.processing.utils;

/**
 * Created by Soloist on 2017/12/21 13:46
 */
public class StringUtil {
    
    public static String validator(String str) {
        if (str != null && !"".equals(str)) {
            str =  str.trim();
        } else {
            throw new RuntimeException("输入内容有误");
        }
        return str;
    }
}
