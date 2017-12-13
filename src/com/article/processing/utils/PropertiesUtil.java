package com.article.processing.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by Soloist on 2017/12/13 0:18
 */
public class PropertiesUtil {
    private Properties properties;

    PropertiesUtil(String path) throws IOException {
        FileInputStream inputStream = new FileInputStream(path);
        properties = new Properties();
        if (path.endsWith("xml")) {
            properties.loadFromXML(inputStream);
        } else if (path.endsWith("properties")) {
            properties.load(inputStream);
        } else {
            System.out.println("路径错误");
        }
    }
    
    public String get(String key) {
        return properties.getProperty(key);
    }
}
