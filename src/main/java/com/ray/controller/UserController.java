package com.ray.controller;

import com.ray.entity.User;
import com.ray.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author Ray
 * @date 2018/6/23 0023
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(){
        return "user/register";
    }

    @RequestMapping(value = "/loginValidate" ,method = RequestMethod.POST)
    public String loginValidate(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        if(username == null || password == null){
            return "user/login";
        }else{
            User user = userService.selectByName(username);
//            System.out.println("login_user:" + user);
            System.out.println("session_username: " + session.getAttribute("username"));
            if(user != null && user.getPassword().equals(password)){
                session.setAttribute("username", username);
                return "redirect:/stu/student/stuList";
            }else{
                return "user/login";
            }
        }
    }

    @RequestMapping(value = "logout")
    public String logout(HttpSession session){
        session.removeAttribute("username");
        return "redirect:/user/login";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@RequestParam("username")String username,
                          @RequestParam("password")String password){
        // 检测用户是否存在
        User user = userService.selectByName(username);
        if(user == null){
            user = new User(username, password);
            userService.insert(user);
            System.out.println("注册成功");
            return "redirect:/user/login";
        }
        System.out.println("注册失败,用户已存在");
        return "redirect:/user/register";
    }
}
