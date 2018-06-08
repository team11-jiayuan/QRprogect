package com.bjtu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjtu.entity.Order;
import com.bjtu.entity.U_USER;
import com.bjtu.service.OrderService;
import com.bjtu.service.UserService;

@Controller
public class RentController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	/**
	 * 判断用户是否登录
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("MyProductManager")
	public String myProductManager(HttpSession session, Model model) {
		U_USER user = (U_USER) session.getAttribute("user");
		if (user != null) {
			return "myproduct";
		} else {
			return "login";
		}
	}
	
	/**
	 * 查询待出租订单
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("getBefore")
	public String getBefore(HttpSession session,  ModelMap model) {
		U_USER user = (U_USER) session.getAttribute("user");
		//根据用户id和订单状态查询订单
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderZt(user.getId(), "0");
		model.addAttribute("orderList", orderList);
		return "order_product";
	}
	
	/**
	 * 查询正在出租的订单
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("getCurrent")
	public String getCurrent(HttpSession session,  ModelMap model) {
		U_USER user = (U_USER) session.getAttribute("user");
		//根据用户id和订单状态查询订单
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderZt(user.getId(), "1");
		model.addAttribute("orderList", orderList);
		return "order_product";
	}
	
	/**
	 * 查询出租记录
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("getRecord")
	public String getRecord(HttpSession session,  ModelMap model) {
		U_USER user = (U_USER) session.getAttribute("user");
		//根据用户id和订单状态查询订单
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderZt(user.getId(), "2");
		model.addAttribute("orderList", orderList);
		return "order_product";
	}
	
	/**
	 * 确认租赁
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("toRent")
	public String toRent(HttpSession session, Model model, Integer product_id, Integer days) {
		//判断用户是否登录
		U_USER user = (U_USER) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			orderService.rent(user.getId(), product_id, days);
			return "rentSuccess";
		}
	}
}
