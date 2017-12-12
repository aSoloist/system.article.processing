package com.article.processing.utils;

import java.io.IOException;
import java.sql.*;

/**
 * Created by hasee on 2017/6/8.
 */
public class DBUtil {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    
    private static PropertiesUtil propertiesUtil;

    static {
        try {
            propertiesUtil = new PropertiesUtil(DBUtil.class.getResource("/").getPath() + 
                    DBUtil.class.getPackage().getName().replaceAll("\\.", "/") + "/conf.xml");
        } catch (IOException e) {
            System.out.println("配置文件加载失败");
        }
    }

    public static void main(String[] args) {
        getConn();
    }

    private static Connection getConn() {
        try {
            
            Class.forName(propertiesUtil.get("className"));
            conn = DriverManager.getConnection(propertiesUtil.get("url"), propertiesUtil.get("username"), propertiesUtil.get("password"));
        } catch (ClassNotFoundException e) {
            System.out.println("数据库驱动加载失败");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("获取连接失败");
        }

        return conn;
    }

    /**
     * 获取sql语句
     * @param sql
     * @return
     */
    public static PreparedStatement getPatmt(String sql){
        conn = getConn();
        try {
            ps = conn.prepareStatement(sql);
        } catch (SQLException e) {
            System.out.println("SQL语句错误");
        }

        return ps;
    }

    /**
     * 关闭更新
     * @param ps
     */
    public static void closeUpdateRes (PreparedStatement ps){
        if (ps != null){
            try {
                conn = ps.getConnection();
                ps.close();
                if (conn != null){
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 关闭查询
     * @param rs
     */
    public static void closeQueryRes (ResultSet rs){
        if (rs != null) {
            try {
                Statement stmt = rs.getStatement();
                if (stmt != null) {
                    conn = stmt.getConnection();
                    stmt.close();
                    if (conn != null) {
                        conn.close();
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
