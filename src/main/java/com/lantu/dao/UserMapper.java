package com.lantu.dao;

import com.lantu.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * 
 * ClassName: UserMapper 
 * @author chenhua
 * @date 2018年3月21日 上午10:11:55
 * @Description: TODO
 */

public interface UserMapper {
    User getById(@Param("id") Long id);
}
