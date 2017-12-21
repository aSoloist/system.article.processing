package com.article.processing.utils;

import com.sun.istack.internal.Nullable;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * Created by Soloist on 2017/12/13 0:18
 */
public class PropertiesUtil {
    private static Properties properties;

    PropertiesUtil(String path) {
        try {
            FileInputStream inputStream = new FileInputStream(path);
            properties = new Properties();
            if (path.endsWith("xml")) {
                properties.loadFromXML(inputStream);
            } else if (path.endsWith("properties")) {
                properties.load(inputStream);
            } else {
                System.out.println("路径错误");
            }
        } catch (IOException e) {
            System.out.println("配置文件加载失败");
        }
    }
    
    public static void load(@Nullable String fileName) {
        String path = PropertiesUtil.class.getResource("/").getPath() + PropertiesUtil.class.getPackage().getName().replaceAll("\\.", "/") + "/";
        try {
            FileInputStream inputStream = new FileInputStream(path + fileName);
            properties = new Properties();
            if (fileName.endsWith("xml")) {
                properties.loadFromXML(inputStream);
            } else if (fileName.endsWith("properties")) {
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
                properties.load(inputStreamReader);
            } else {
                System.out.println("路径错误");
            }
        } catch (IOException e) {
            System.out.println("配置文件加载失败");
        }
    }
    
    public static String get(String key) {
        return properties.getProperty(key);
    }
}
