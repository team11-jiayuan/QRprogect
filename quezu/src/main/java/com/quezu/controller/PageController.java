package com.quezu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quezu.pojo.User;

@Controller
public class PageController {
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(value = { "/", "index" })
	public String showIndex() {
		return "index";
	}
	
	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping("/login")
	public String toLogin() {
		return "login";
	}
	
	/**
	 * 注册页面
	 * @return
	 */
	@RequestMapping("/register")
	public String toRegister() {
		return "register";
	}
	
	/**
	 * 个人中心
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myHome")
	public String toHomePage(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "myCenterHome");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe个人中心
	 * @return
	 */
	@RequestMapping("myCenterHome")
	public String toHomePage() {
		return "management/myCenterHome";
	}
	
	/**
	 * 发布物品
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("publish")
	public String toPublicProduct(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "toPublish");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe发布物品
	 * @return
	 */
	@RequestMapping("toPublish")
	public String toPublicProduct() {
		return "product/publishProduct";
	}
	
	/**
	 * 个人信息
	 * @return
	 */
	@RequestMapping("myInformation")
	public String toMyInformation(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "information");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe个人信息
	 * @return
	 */
	@RequestMapping("information")
	public String toMyInformation() {
		return "management/myInformation";
	}
	
	/**
	 * 我的账户
	 * @return
	 */
	@RequestMapping("myAccount")
	public String toMyAccount(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "account");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe我的账户
	 * @return
	 */
	@RequestMapping("account")
	public String toMyAccount() {
		return "management/myAccount";
	}
	
	/**
	 * 地址管理
	 * @return
	 */
	@RequestMapping("addressManagement")
	public String toMyAddress(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "address");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe地址管理
	 * @return
	 */
	@RequestMapping("address")
	public String toMyAddress() {
		return "management/myAddress";
	}
	
	/**
	 * 我的订单
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myOrder")
	public String toMyOrder(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "order");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe我的订单
	 * @return
	 */
	@RequestMapping("order")
	public String toMyOrder() {
		return "management/myOrder";
	}
	
	/**
	 * 我的租赁
	 * @return
	 */
	@RequestMapping("myRent")
	public String toMyRent(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "rent");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe我的租赁
	 * @return
	 */
	@RequestMapping("rent")
	public String toMyRent() {
		return "management/myRent";
	}
	
	/**
	 * 我的出租
	 * @return
	 */
	@RequestMapping("myRentOut")
	public String toMyRentOut(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "rentOut");
			return "home";
		}else {
			return "login";
		}
	}

	/**
	 * iframe我的出租
	 * @return
	 */
	@RequestMapping("rentOut")
	public String toMyRentOut() {
		return "order/rentoutOrder/myRentOut";
	}
	
	/**
	 * 我的关注
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myFocus")
	public String toMyWatch(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "focus");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * 我的关注
	 * @return
	 */
	@RequestMapping("focus")
	public String toMyWatch() {
		return "management/myFocus";
	}
	
	/**
	 * 基本信息
	 * @return
	 */
	@RequestMapping("basicInformation")
	public String toBasicInformation(HttpSession session, ModelMap model) {
		return "management/basicInformation";
	}
}
