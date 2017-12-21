package com.article.processing.model;

import java.sql.Timestamp;
import java.util.UUID;

/**
 * 稿件类
 * Created by Soloist on 2017/12/4 19:55
 */
public class Article {
    //id
    private String id = UUID.randomUUID().toString();
    //题目
    private String title;
    //内容
    private String content;
    //作者
    private String userId;
    //创建时间
    private Timestamp createTime = new Timestamp(new java.util.Date().getTime());
    //组
    private String group = UUID.randomUUID().toString();
    //状态
    private int status = 0;
    
    private int ver = 1;

    public int getVer() {
        return ver;
    }

    public void setVer(int ver) {
        this.ver = ver;
    }

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

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
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
