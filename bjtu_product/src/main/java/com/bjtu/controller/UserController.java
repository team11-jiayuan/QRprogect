package com.bjtu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bjtu.entity.OBJECT_ADDRESS;
import com.bjtu.entity.U_ADDRESS;
import com.bjtu.entity.U_USER;
import com.bjtu.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	// 转发至注册页面
	@RequestMapping("toregist")
	public String toregist() {
		return "regist";
	}

	// 转发至登陆页面
	@RequestMapping("tologin")
	public String tologin() {
		return "login";
	}

	// 用户注册
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String regist(U_USER user, U_ADDRESS address) {
		userService.add(user, address);
		return "redirect:tologin.do";
	}

	// 用户登陆
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(U_USER user,HttpSession session,Model model) {
		U_USER user_login=userService.getUser(user);
		if(user_login!=null){
			session.setAttribute("user", user_login);
			return "redirect:/index.jsp";
		}else{
			model.addAttribute("errors", "用户名或密码错误！");
			return "forward:tologin.do";
		}		
	}
	
	//跳转至用户管理页面
	@RequestMapping("userManage")
	public String UserManage(HttpSession session,Model model){
		
		U_USER user=(U_USER) session.getAttribute("user");
		
		U_USER user_data=userService.getUserById(user.getId());
		session.setAttribute("user", user_data);
		
		HashMap<String,Object> map=userService.getAddress(user_data);
		model.addAttribute("phone", map.get("phone"));
		model.addAttribute("province", map.get("province"));
		model.addAttribute("city", map.get("city"));
		model.addAttribute("district", map.get("district"));
	
		return "usermanage";
	}
	
	//更新用户信息
	@RequestMapping("updateUser")
	public String updateUser(OBJECT_ADDRESS address,HttpSession session){
		
		U_USER user=(U_USER) session.getAttribute("user");
		address.setUser_id(user.getId());
		
		userService.updateUser(address);
	
		return "forward:userManage.do";
	}
	
	//退出登陆
	@RequestMapping("logout")
	public String outLogin(HttpSession session){
		session.invalidate();
		return "redirect:index.jsp";
		
	}

}
