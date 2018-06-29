package com.quezu.service;

import java.util.List;
import java.util.Map;

import com.quezu.pojo.Order;

public interface OrderService {

	/**
	 * 插入订单信息
	 * @param productId
	 * @param userId
	 * @return
	 */
	public int inertOrder(String productId, Integer userId);

	/**
	 * 根据物主id和订单状态查询订单
	 * @param paramsMap
	 * @return
	 */
	public List<Order> selectOrderByUserIdAndOrderStatus(Map<String, Object> paramsMap);

	/**
	 * 根据id取消订单
	 * @param orderId
	 */
	public int cancelOrderById(String orderId);

	/**
	 * 根据订单编号查询订单
	 * @param orderId
	 * @return
	 */
	public Order selectOrderByOrderId(String orderId);

	/**
	 * 申请租赁
	 * @param order
	 * @return
	 */
	public int applyRent(Order order);

}
