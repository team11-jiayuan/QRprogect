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

}
