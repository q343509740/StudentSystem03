package com.ray.service.impl;

import com.ray.dao.UserDao;
import com.ray.entity.User;
import com.ray.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
@Service("UserService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User selectByName(String username) {
        User user = userDao.selectByName(username);
        return user;
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User checkLogin(String username, String password) {
        User user = userDao.selectByName(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }
}
