package com.article.processing.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

/**
 * 用户类
 * Created by Soloist on 2017/12/4 19:55
 */
public class User {
    //id
    String id = UUID.randomUUID().toString();
    //昵称
    String nickname;
    //密码
    String password;
    //姓名
    String username;
    //单位
    String unit;
    //地址
    String address;
    //手机号
    String phone;
    //邮箱
    String email;
    //状态
    int status = 0;
    //创建时间
    Timestamp createTime = new Timestamp(new Date().getTime());
    
    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
