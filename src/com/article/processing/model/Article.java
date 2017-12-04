package com.article.processing.model;

import java.sql.Date;
import java.util.UUID;

/**
 * 稿件类
 * Created by Soloist on 2017/12/4 19:55
 */
public class Article {
    //id
    String id = UUID.randomUUID().toString();
    //题目
    String title;
    //内容
    String content;
    //作者
    String userId;
    //创建时间
    Date createTime = new Date(new java.util.Date().getTime());
    //组
    String group = UUID.randomUUID().toString();
    //状态
    int status = 0;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
