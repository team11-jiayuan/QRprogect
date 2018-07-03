package com.quezu.mapper;

import java.util.List;
import java.util.Map;

import com.quezu.pojo.Order;

public interface OrderMapper {

	/**
	 * 插入订单信息
	 * @param order
	 * @return
	 */
	public int insertOrder(Order order);

	/**
	 * 根据用户id和订单状态查询订单
	 * @param paramsMap
	 * @return
	 */
	public List<Order> selectOrderByUserIdAndOrderStatus(Map<String, Object> paramsMap);

	/**
	 * 根据订单id修改订单信息
	 * @param orderId
	 * @param string
	 * @return
	 */
	public int updateOrderById(Order order);

	/**
	 * 根据订单编号查询订单
	 * @param orderId
	 * @return
	 */
	public Order selectOrderByOrderId(String orderId);

}
