package com.article.processing.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.*;

/**
 * Created by Soloist on 2017/6/8.
 */
public class DBUtil {
    private static ComboPooledDataSource comboPooledDataSource;

    private DBUtil() {
    }

    static {
        PropertiesUtil.load("c3p0-conf.properties");
        comboPooledDataSource = new ComboPooledDataSource();
        try {
            comboPooledDataSource.setDriverClass(PropertiesUtil.get("driverClass"));
            comboPooledDataSource.setJdbcUrl(PropertiesUtil.get("url"));
            comboPooledDataSource.setUser(PropertiesUtil.get("username"));
            comboPooledDataSource.setPassword(PropertiesUtil.get("password"));
            comboPooledDataSource.setMinPoolSize(Integer.parseInt(PropertiesUtil.get("c3p0.minPoolSize")));
            comboPooledDataSource.setMaxPoolSize(Integer.parseInt(PropertiesUtil.get("c3p0.maxPoolSize")));
            comboPooledDataSource.setAcquireIncrement(Integer.parseInt(PropertiesUtil.get("c3p0.acquireIncrement")));
            comboPooledDataSource.setAcquireRetryAttempts(Integer.parseInt(PropertiesUtil.get("c3p0.acquireRetryAttempts")));
            comboPooledDataSource.setAcquireRetryDelay(Integer.parseInt(PropertiesUtil.get("c3p0.acquireRetryDelay")));
            comboPooledDataSource.setAutoCommitOnClose(Boolean.parseBoolean(PropertiesUtil.get("c3p0.autoCommitOnClose")));
            comboPooledDataSource.setCheckoutTimeout(Integer.parseInt(PropertiesUtil.get("c3p0.checkoutTimeout")));
            comboPooledDataSource.setIdleConnectionTestPeriod(Integer.parseInt(PropertiesUtil.get("c3p0.idleConnectionTestPeriod")));
            comboPooledDataSource.setMaxIdleTime(Integer.parseInt(PropertiesUtil.get("c3p0.maxIdleTime")));
            comboPooledDataSource.setTestConnectionOnCheckin(Boolean.parseBoolean(PropertiesUtil.get("c3p0.testConnectionOnCheckin")));
            comboPooledDataSource.setMaxStatements(Integer.parseInt(PropertiesUtil.get("c3p0.maxStatements")));
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
    }

    private static Connection getConn() {
        Connection connection = null;
        try {
            connection = comboPooledDataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    /**
     * 获取sql语句
     *
     * @param sql
     * @return
     */
    public static PreparedStatement getPreparedStatement(String sql) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConn().prepareStatement(sql);
        } catch (SQLException e) {
            System.out.println("SQL语句错误");
        }

        return preparedStatement;
    }

    /**
     * 关闭更新
     *
     * @param ps
     */
    public static void closeUpdateRes(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.getConnection().close();
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 关闭查询
     *
     * @param rs
     */
    public static void closeQueryRes(ResultSet rs) {
        if (rs != null) {
            try {
                Statement stmt = rs.getStatement();
                if (stmt != null) {
                    stmt.getConnection().close();
                    stmt.close();
                }
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
