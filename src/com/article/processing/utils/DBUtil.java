package com.article.processing.utils;

import java.sql.*;

/**
 * Created by hasee on 2017/6/8.
 */
public class DBUtil {

    private static Connection conn = null;
    private static PreparedStatement ps = null;

    public static void main(String[] args) {
        getConn();
    }

    private static Connection getConn() {
        try {
            PropertiesUtil.load("conf.xml");
            Class.forName(PropertiesUtil.get("className"));
            conn = DriverManager.getConnection(PropertiesUtil.get("url"), PropertiesUtil.get("username"), PropertiesUtil.get("password"));
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
