package com.quezu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quezu.pojo.Order;
import com.quezu.pojo.User;
import com.quezu.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * 我的出租--待出租
	 * @param model
	 * @return
	 */
	@RequestMapping("readyForRent")
	public String readyForRent(ModelMap model) {
		model.addAttribute("toPage", "toReadyForRent");
		return "order/rentoutOrder/myRentOut";
	}
	
	/**
	 * iframe
	 * 我的出租--待出租
	 * @return
	 */
	@RequestMapping("toReadyForRent")
	public String readyForRent(HttpSession session, ModelMap model) {
		Integer userId = ((User)session.getAttribute("currentUser")).getId();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("userId", userId);
		List<String> orderStatus = new ArrayList<String>();
		orderStatus.add("1");
		orderStatus.add("2");
		orderStatus.add("3");
		orderStatus.add("4");
		paramsMap.put("orderStatus", orderStatus);
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
		model.addAttribute("orderList", orderList);
		return "order/rentoutOrder/readyForRent";
	}
	
	/**
	 * 我的出租--取消订单
	 * @param orderId
	 * @return
	 */
	@RequestMapping("cancelOrder")
	@ResponseBody
	public Map<String, String> cancelOrder(String orderId) {
		orderService.cancelOrderById(orderId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("message", "ok");
		return map;
	}
	
	/**
	 * 我的出租--历史记录
	 * @param model
	 * @return
	 */
	@RequestMapping("historicRecord")
	public String historicRecord(ModelMap model) {
		model.addAttribute("toPage", "toHistoricRecord");
		return "order/rentoutOrder/myRentOut";
	}
	
	/**
	 * iframe
	 * 我的出租--历史记录
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("toHistoricRecord")
	public String historicRecord(HttpSession session, ModelMap model) {
		Integer userId = ((User)session.getAttribute("currentUser")).getId();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("userId", userId);
		List<String> orderStatus = new ArrayList<String>();
		orderStatus.add("0");
		orderStatus.add("10");
		paramsMap.put("orderStatus", orderStatus);
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
		model.addAttribute("orderList", orderList);
		return "order/rentoutOrder/historicRecord";
	}
	
	/**
	 * 我的出租--正在出租
	 * @param model
	 * @return
	 */
	@RequestMapping("currentRent")
	public String currentRent(ModelMap model) {
		model.addAttribute("toPage", "toCurrentRent");
		return "order/rentoutOrder/myRentOut";
	}
	
	/**
	 * iframe
	 * 我的出租--正在出租
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("toCurrentRent")
	public String currentRent(HttpSession session, ModelMap model) {
		Integer userId = ((User)session.getAttribute("currentUser")).getId();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("userId", userId);
		List<String> orderStatus = new ArrayList<String>();
		orderStatus.add("5");
		orderStatus.add("6");
		orderStatus.add("7");
		orderStatus.add("8");
		orderStatus.add("9");
		paramsMap.put("orderStatus", orderStatus);
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
		model.addAttribute("orderList", orderList);
		return "order/rentoutOrder/currentRent";
	}
	
	/**
	 * 申请租赁
	 * @param order
	 * @return
	 */
	@RequestMapping("applyRent")
	public String applyRent(Order order, HttpSession session) {
		order.setRenterId(((User)session.getAttribute("currentUser")).getId());
		orderService.applyRent(order);
		return null;
	}
	
	/**
	 * 我的租赁--正在出租
	 * @param model
	 * @return
	 */
	@RequestMapping("myCurrentRent")
	public String myCurrentRent(ModelMap model) {
		model.addAttribute("toPage", "toMyCurrentRent");
		return "order/myRentOrder/myRent";
	}
	
	/**
	 * iframe
	 * 我的租赁--正在出租
	 * @return
	 */
	@RequestMapping("toMyCurrentRent")
	public String myCurrentRent() {
		return "order/myRentOrder/currentRent";
	}
	
	/**
	 * 我的租赁--历史记录
	 * @param model
	 * @return
	 */
	@RequestMapping("rentHistory")
	public String rentHistory(ModelMap model) {
		model.addAttribute("toPage", "toRentHistory");
		return "order/myRentOrder/myRent";
	}
	
	/**
	 * iframe
	 * 我的租赁--历史记录
	 * @return
	 */
	@RequestMapping("toRentHistory")
	public String rentHistory() {
		return "order/myRentOrder/rentHistory";
	}
	
}
