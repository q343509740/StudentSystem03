package com.ray.service;

import com.ray.entity.User;

import java.util.List;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
public interface UserService {

    /**
     * 根据用户名查询用户信息
     */
    User selectByName(String username);

    /**
     * 新增用户信息
     */
    void insert(User user);

    /**
     * 验证用户信息
     */
    User checkLogin(String username, String password);
}
