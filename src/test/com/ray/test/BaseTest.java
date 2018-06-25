package com.ray.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Ray
 * @date 2018/6/23 0023
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
// 使用Springtest测试框架
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class BaseTest {
}
