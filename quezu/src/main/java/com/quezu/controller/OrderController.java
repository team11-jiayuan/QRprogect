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

import com.quezu.pojo.Order;
import com.quezu.pojo.User;
import com.quezu.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * 我的出租--待出租
	 * @return
	 */
	@RequestMapping("readyForRent")
	public String readyForRent(HttpSession session, ModelMap model) {
		Integer userId = ((User)session.getAttribute("currentUser")).getId();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("userId", userId);
		List<String> orderStatus = new ArrayList<String>();
		orderStatus.add("1");
		paramsMap.put("orderStatus", orderStatus);
		List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
//		Order o = orderList.get(0);
//		Map<String, Object> em = o.getExtMap();
//		System.out.println(em.get("productName"));
//		System.out.println(em.get("primaryImg"));
//		System.out.println(em.get("rentMode"));
//		System.out.println(em.get("deposit"));
//		System.out.println(em.get("rent"));
//		System.out.println(em.get("publishTime"));
//		System.out.println(em.get("renterName"));
		model.addAttribute("orderList", orderList);
		return "order/rentoutOrder/readyForRent";
	}
	
}
