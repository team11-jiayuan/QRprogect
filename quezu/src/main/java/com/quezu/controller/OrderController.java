package com.quezu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quezu.pojo.Order;
import com.quezu.pojo.Product;
import com.quezu.pojo.User;
import com.quezu.service.OrderService;
import com.quezu.service.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
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
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Integer userId = user.getId();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("ownerId", userId);
			paramsMap.put("statusMin", 1);
			paramsMap.put("statusMax", 4);
			List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
			model.addAttribute("orderList", orderList);
			return "order/rentoutOrder/readyForRent";
		}else {
			return null;
		}
	}
	
	/**
	 * 我的出租--取消订单
	 * @param orderId
	 * @return
	 */
	@RequestMapping("cancelOrder")
	@ResponseBody
	public Map<String, String> cancelOrder(String orderId, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.cancelOrderById(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
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
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Integer userId = user.getId();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("ownerId", userId);
			List<Integer> orderStatusList = new ArrayList<Integer>();
			orderStatusList.add(0);
			orderStatusList.add(10);
			paramsMap.put("orderStatusList", orderStatusList);
			List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
			model.addAttribute("orderList", orderList);
			return "order/rentoutOrder/historicRecord";
		}else {
			return null;
		}
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
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Integer userId = user.getId();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("ownerId", userId);
			List<Integer> orderStatusList = new ArrayList<Integer>();
			orderStatusList.add(5);
			orderStatusList.add(6);
			orderStatusList.add(7);
			orderStatusList.add(8);
			orderStatusList.add(9);
			orderStatusList.add(14);
			orderStatusList.add(15);
			orderStatusList.add(16);
			orderStatusList.add(17);
			orderStatusList.add(18);
			orderStatusList.add(19);
			paramsMap.put("orderStatusList", orderStatusList);
			List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
			model.addAttribute("orderList", orderList);
			return "order/rentoutOrder/currentRent";
		}else {
			return null;
		}
	}
	
	/**
	 * 申请租赁
	 * @param order
	 * @return
	 */
	@RequestMapping("applyRent")
	public String applyRent(Order order, HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			order.setRenterId(user.getId());
			orderService.applyRent(order);
			model.addAttribute("toPage", "rent");
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * 我的租赁--正在租赁
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
	 * 我的租赁--正在租赁
	 * @return
	 */
	@RequestMapping("toMyCurrentRent")
	public String myCurrentRent(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Integer userId = user.getId();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("renterId", userId);
			List<Integer> orderStatusList = new ArrayList<Integer>();
			orderStatusList.add(2);
			orderStatusList.add(3);
			orderStatusList.add(4);
			orderStatusList.add(5);
			orderStatusList.add(6);
			orderStatusList.add(7);
			orderStatusList.add(8);
			orderStatusList.add(9);
			orderStatusList.add(13);
			orderStatusList.add(14);
			orderStatusList.add(15);
			orderStatusList.add(16);
			orderStatusList.add(17);
			orderStatusList.add(18);
			orderStatusList.add(19);
			paramsMap.put("orderStatusList", orderStatusList);
			List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
			model.addAttribute("orderList", orderList);
			return "order/myRentOrder/currentRent";
		}else {
			return null;
		}
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
	public String rentHistory(HttpSession session, ModelMap model) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Integer userId = user.getId();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("renterId", userId);
			paramsMap.put("statusMin", 10);
			paramsMap.put("statusMax", 12);
			List<Order> orderList = orderService.selectOrderByUserIdAndOrderStatus(paramsMap);
			model.addAttribute("orderList", orderList);
			return "order/myRentOrder/rentHistory";
		}else {
			return null;
		}
	}
	
	/**
	 * 同意租赁
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("agreeRent")
	@ResponseBody
	public Map<String, String> agreeRent(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.agreeRent(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 拒绝租赁
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("disagreeRent")
	@ResponseBody
	public Map<String, String> disagreeRent(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.disagreeRent(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 承租人确认被拒绝租赁的消息
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("affirmDisagree")
	@ResponseBody
	public Map<String, String> affirmDisagree(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.affirmDisagree(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 支付页面
	 * @param session
	 * @param model
	 * @param orderId
	 * @return
	 */
	@RequestMapping("payment/{orderId}")
	public String payment(HttpSession session, ModelMap model, @PathVariable String orderId) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			Order order = orderService.selectOrderByOrderId(orderId);
			Product product = productService.selectProductByProductId(order.getProductId());
			BigDecimal totalRent = product.getRent().multiply(BigDecimal.valueOf(order.getDaysOrMonths().intValue()));
			BigDecimal total = totalRent.add(product.getDeposit());
			model.addAttribute("total", total);
			model.addAttribute("totalRent", totalRent);
			model.addAttribute("order", order);
			model.addAttribute("product", product);
			return "payment";
		}else {
			return "login";
		}
	}
	
	/**
	 * 支付订单
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("toPay")
	@ResponseBody
	public Map<String, String> toPay(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.payForTheOrder(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 确认收到物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("receive")
	@ResponseBody
	public Map<String, String> receive(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.receive(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 申请提前归还物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("earlyReturn")
	@ResponseBody
	public Map<String, String> earlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.earlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 拒绝提前归还物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("disagreeEarlyReturn")
	@ResponseBody
	public Map<String, String> disagreeEarlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.disagreeEarlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}

	/**
	 * 承租人确认被拒绝提前归还物品的消息
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("affirmDisagreeEarlyReturn")
	@ResponseBody
	public Map<String, String> affirmDisagreeEarlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.affirmDisagreeEarlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}

	/**
	 * 同意提前归还物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("agreeEarlyReturn")
	@ResponseBody
	public Map<String, String> agreeEarlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.agreeEarlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 物主确认收到提前归还的物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("receiveEarlyReturn")
	@ResponseBody
	public Map<String, String> receiveEarlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.receiveEarlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 承租人确认已归还提前归还的物品
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("affirmEarlyReturn")
	@ResponseBody
	public Map<String, String> affirmEarlyReturn(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.affirmEarlyReturn(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 物主返还押金和租金
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("returnDeposit")
	@ResponseBody
	public Map<String, String> returnDeposit(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.returnDeposit(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 承租人确认收到押金和租金，订单完成
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("affirmReceiveDeposit")
	@ResponseBody
	public Map<String, String> affirmReceiveDeposit(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.affirmReceiveDeposit(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 申请延长租期
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("extendRent")
	@ResponseBody
	public Map<String, String> extendRent(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.extendRent(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 确认延长日期
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("affirmExtendDate")
	@ResponseBody
	public Map<String, String> affirmExtendDate(String orderId, Integer extendDate, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.affirmExtendDate(orderId, extendDate);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 拒绝延长租期
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("disagreeExtend")
	@ResponseBody
	public Map<String, String> disagreeExtend(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.disagreeExtend(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 同意延长租期
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("agreeExtend")
	@ResponseBody
	public Map<String, String> agreeExtend(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.agreeExtend(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
	
	/**
	 * 支付延长使用租金
	 * @param orderId
	 * @param session
	 * @return
	 */
	@RequestMapping("paymentExtend")
	@ResponseBody
	public Map<String, String> paymentExtend(String orderId, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			orderService.paymentExtend(orderId);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "ok");
			return map;
		}else {
			return null;
		}
	}
}
