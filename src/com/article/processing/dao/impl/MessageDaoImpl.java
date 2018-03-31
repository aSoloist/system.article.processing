package com.article.processing.dao.impl;

import com.article.processing.dao.MessageDao;
import com.article.processing.model.Message;
import com.article.processing.utils.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Soloist on 2017/12/18 17:04
 */
public class MessageDaoImpl implements MessageDao {
    
    private void createMessage(Message message, ResultSet resultSet) throws SQLException {
        message.setId(resultSet.getString("id"));
        message.setSendId(resultSet.getString("send_id"));
        message.setMessageContent(resultSet.getString("message_content"));
        message.setCreateTime(resultSet.getTimestamp("create_time"));
        message.setStatus(resultSet.getInt("status"));
        message.setTitle(resultSet.getString("title"));
    }

    /**
     * 获取最新消息
     * @return
     */
    public Message getNew() {
        String sql = "select * from message where status <> -1 order by create_time limit 1";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
        ResultSet resultSet = null;
        Message message = null;
        try {
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                message = new Message();
                createMessage(message, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return message;
    }

    /**
     * 获取所有消息
     * @return
     */
    public List<Message> getAll() {
        String sql = "select * from message where status <> -1 order by create_time desc";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
        ResultSet resultSet = null;
        List<Message> list = new ArrayList<>();
        Message message;
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                message = new Message();
                createMessage(message, resultSet);
                list.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return list;
    }

    /**
     * 通过id获取消息
     * @param id
     * @return
     */
    public Message getById(String id) {
        String sql = "select * from message where id = ? and status <> -1";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
        ResultSet resultSet = null;
        Message message = null;
        try {
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                message = new Message();
                createMessage(message, resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeQueryRes(resultSet);
        }
        return message;
    }

    /**
     * 插入一条消息
     * @param model
     * @return
     */
    public int insert(Message model) {
        String sql = "insert into message (id, send_id, message_content, create_time, status, title) values (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
        int result = 0;
        try {
            preparedStatement.setString(1, model.getId());
            preparedStatement.setString(2, model.getSendId());
            preparedStatement.setString(3, model.getMessageContent());
            preparedStatement.setTimestamp(4, model.getCreateTime());
            preparedStatement.setInt(5, model.getStatus());
            preparedStatement.setString(6, model.getTitle());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 更新消息
     * @param model
     * @return
     */
    public int update(Message model) {
        String sql = "update message set send_id = ?, message_content = ?, create_time = ?," +
                " status = ?, title = ? where id = ?";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
        int result = 0;
        try {
            preparedStatement.setString(1, model.getSendId());
            preparedStatement.setString(2, model.getMessageContent());
            preparedStatement.setTimestamp(3, model.getCreateTime());
            preparedStatement.setInt(4, model.getStatus());
            preparedStatement.setString(5, model.getTitle());
            preparedStatement.setString(6, model.getId());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeUpdateRes(preparedStatement);
        }
        return result;
    }

    /**
     * 删除消息
     * @param id
     * @return
     */
    public int delete(String id) {
        return updateStatus(id, -1);
    }

    /**
     * 更新消息状态
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(String id, int status) {
        String sql = "update message set status = ? where id = ?";
        PreparedStatement preparedStatement = DBUtil.getPreparedStatement(sql);
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
     * 判断消息是否存在
     * @param id
     * @return
     */
    public boolean isIdExist(String id) {
        return getById(id) != null;
    }
}
