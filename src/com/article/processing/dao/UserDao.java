package com.article.processing.dao;

import com.article.processing.model.User;

/**
 * 用户数据访问层接口
 * Created by Soloist on 2017/12/4 19:49
 */
public interface UserDao extends BaseDao<User> {
    
    User getUserByPhone(String phone);
    
    Boolean isExist(String email, String phone);
    
    User getUserByEmail(String email);
}
