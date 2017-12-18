package com.article.processing.dao.impl;

import com.article.processing.dao.UserDao;
import com.article.processing.model.User;
import com.article.processing.utils.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户数据访问层实现
 * Created by Soloist on 2017/12/4 19:54
 */
public class UserDaoImpl implements UserDao {
    
    private void createUser(User user, ResultSet resultSet) {
        try {
            user.setId(resultSet.getString("id"));
            user.setNickname(resultSet.getString("nickname"));
            user.setPassword(resultSet.getString("password"));
            user.setUsername(resultSet.getString("username"));
            user.setUnit(resultSet.getString("unit"));
            user.setAddress(resultSet.getString("address"));
            user.setPhone(resultSet.getString("phone"));
            user.setEmail(resultSet.getString("email"));
            user.setStatus(resultSet.getInt("status"));
            user.setCreateTime(resultSet.getTimestamp("create_time"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取所有用户
     * @return
     */
    public List<User> getAll() {
        String sql = "select * from user where status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        List<User> list = new ArrayList<>();
        User user;
        try {
            resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                user = new User();
                createUser(user, resultSet);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return list;
    }

    /**
     * 通过id获取用户
     * @param id
     * @return
     */
    public User getById(String id) {
        String sql = "select * from user where id = ? and status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        User user = null;
        try {
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                createUser(user, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return user;
    }

    /**
     * 添加新用户
     * @param model
     * @return
     */
    public int insert(User model) {
        String sql = "insert into user (id, nickname, password, username, unit, address, phone, email, status, create_time) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        int result = 0;
        try {
            preparedStatement.setString(1, model.getId());
            preparedStatement.setString(2, model.getNickname());
            preparedStatement.setString(3, model.getPassword());
            preparedStatement.setString(4, model.getUsername());
            preparedStatement.setString(5, model.getUnit());
            preparedStatement.setString(6, model.getAddress());
            preparedStatement.setString(7, model.getPhone());
            preparedStatement.setString(8, model.getEmail());
            preparedStatement.setInt(9, model.getStatus());
            preparedStatement.setTimestamp(10, model.getCreateTime());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 更新用户
     * @param model
     * @return
     */
    public int update(User model) {
        String sql = "update user set nickname = ?, password = ?, username = ?, unit = ?, address = ?, phone = ?, email = ? where id = ?";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        int result = 0;
        try {
            preparedStatement.setString(1, model.getNickname());
            preparedStatement.setString(2, model.getPassword());
            preparedStatement.setString(3, model.getUsername());
            preparedStatement.setString(4, model.getUnit());
            preparedStatement.setString(5, model.getAddress());
            preparedStatement.setString(6, model.getPhone());
            preparedStatement.setString(7, model.getEmail());
            preparedStatement.setString(8, model.getId());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    public int delete(String id) {
        return updateStatus(id, -1);
    }

    /**
     * 更新用户状态
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(String id, int status) {
        String sql = "update user set status = ? where id = ?";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        int result = 0;
        try {
            preparedStatement.setInt(1, status);
            preparedStatement.setString(2, id);
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 判断id是否重复
     * @param id
     * @return
     */
    public boolean isIdExist(String id) {
        return getById(id) != null;
    }

    /**
     * 通过手机号和密码获取用户
     * @param phone
     * @param password
     * @return
     */
    public User getUserByPhoneAndPass(String phone, String password) {
        String sql = "select * from user where phone = ? and password = ? and status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        User user = new User();
        ResultSet resultSet = null;
        try {
            preparedStatement.setString(1, phone);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                createUser(user, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return user;
    }

    /**
     * 通过邮箱和密码获取用户
     * @param email
     * @param password
     * @return
     */
    public User getUserByEmailAndPass(String email, String password) {
        String sql = "select * from user where email = ? and password = ? and status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        User user = new User();
        ResultSet resultSet = null;
        try {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                createUser(user, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return user;
    }

    /**
     * 判断用户是否存在
     * @param email
     * @param phone
     * @return
     */
    public Boolean isExist(String email, String phone) {
        String sql = "select * from user where status <> -1 and email = ? or phone = ?";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        Boolean isExist = true;
        try {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, phone);
            resultSet = preparedStatement.executeQuery();
            isExist = resultSet.next();
        } catch (SQLException e) {
            System.out.println("数据库异常");
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        
        return isExist;
    }

    /**
     * 通过邮箱获取用户
     * @param email
     * @return
     */
    public User getUserByEmail(String email) {
        String sql = "select * from user where email = ? and status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPatmt(sql);
        ResultSet resultSet = null;
        User user = null;
        try {
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                createUser(user, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return user;
    }
}
