package com.ray.test;

import com.ray.dao.UserDao;
import com.ray.entity.User;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
public class UserServiceImplTest extends BaseTest {

    @Resource
    private UserDao userDao;

    @Test
    public void selectByName() {
        User user = userDao.selectByName("Ray");
        System.out.println(user);
    }

    @Test
    public void insert() {
    }
}