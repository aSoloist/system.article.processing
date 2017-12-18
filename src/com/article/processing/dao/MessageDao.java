package com.article.processing.dao;

import com.article.processing.model.Message;

/**
 * Created by Soloist on 2017/12/18 16:59
 */
public interface MessageDao extends BaseDao<Message> {
    Message getNew();
}
