package com.article.processing.dao;

import com.article.processing.model.User;

/**
 * 用户数据访问层接口
 * Created by Soloist on 2017/12/4 19:49
 */
public interface UserDao extends BaseDao<User> {
    
    User getUserByPhoneAndPass(String phone, String password);
    
    User getUSerByEmailAndPass(String email, String password);
    
    Boolean isExist(String email, String phone);
}
