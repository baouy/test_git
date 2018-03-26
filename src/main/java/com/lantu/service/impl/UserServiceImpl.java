package com.lantu.service.impl;

import com.lantu.dao.UserMapper;
import com.lantu.model.User;
import com.lantu.service.UserServicre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * ClassName: UserServiceImpl 
 * @author chenhua
 * @date 2018年3月21日 上午10:11:47
 * @Description: TODO
 */
@Service("userService")
public class UserServiceImpl implements UserServicre {
    @Autowired
    private UserMapper userMapper;

    public User getById(Long id) {
        return userMapper.getById(id);
    }
}
