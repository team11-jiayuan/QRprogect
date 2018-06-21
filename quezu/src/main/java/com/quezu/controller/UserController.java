package com.quezu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quezu.pojo.User;
import com.quezu.service.UserService;
import com.quezu.util.MD5Utils;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 用户注册
	 * @param user
	 * @param rePassword
	 * @return
	 */
	@RequestMapping(value = "addUser",  method = RequestMethod.POST)
	public String register(User user, String rePassword) {
		Boolean result = userService.insert(user);
		if(result == true) {
			return "redirect:login";
		}else {
			return "redirect:serverException";
		}
	}
	
	/**
	 * 验证用户名是否已经注册
	 * @param userName
	 * @return
	 */
	@RequestMapping("checkUsername")
	@ResponseBody
	public Map<String, String> checkUsername(String userName) {
		Map<String, String> map = new HashMap<String, String>();
		User user = userService.selectUserByUsername(userName);
		if(user != null) {
			map.put("message", "该用户名已经存在，请重新输入！");
		}else {
			map.put("message", "ok");
		}
		return map;
	}
	
	/**
	 * 登录前对用户名和密码进行校验
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping("loginCheck")
	@ResponseBody
	public Map<String, String> loginCheck(String userName, String password){
		Map<String, String> map = new HashMap<String, String>();
		User user = userService.selectUserByUsername(userName);
		if(user == null) {
			map.put("message", "用户名或密码错误");
		}else if(!MD5Utils.isEqualsToMd5(password, user.getPassword())) {
			map.put("message", "用户名或密码错误");
		}else {
			map.put("message", "ok");
		}
		return map;
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "toLogin", method = RequestMethod.POST)
	public String toLogin(String userName, HttpSession session) {
		User user = userService.selectUserByUsername(userName);
		session.setAttribute("currentUser", user);
		return "redirect:index";
	}
	
	/**
	 * 用户退出
	 * @param session
	 * @return
	 */
	@RequestMapping("signOut")
	public String signOut(HttpSession session) {
		session.removeAttribute("currentUser");
		return "redirect:index";
	}
	
	
	
}
