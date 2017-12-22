package com.article.processing.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

/**
 * 消息类
 * Created by Soloist on 2017/12/18 16:55
 */
public class Message {
    //id
    private String id = UUID.randomUUID().toString();
    //发送者id
    private String sendId;
    //消息标题
    private String title;
    //消息内容
    private String messageContent;
    //创建时间
    private Timestamp createTime = new Timestamp(new Date().getTime());
    //状态
    private int status = 0;

    public Message() {
    }

    public Message(String content) {
        this.messageContent = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
