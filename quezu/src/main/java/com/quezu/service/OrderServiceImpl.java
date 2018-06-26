package com.quezu.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quezu.mapper.OrderMapper;
import com.quezu.pojo.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	/**
	 * 插入订单信息
	 */
	@Override
	public int inertOrder(String productId, Integer userId) {
		Order order = new Order();
		String orderId = UUID.randomUUID().toString().replaceAll("-", "");
		order.setId(orderId);
		order.setProductId(productId);
		order.setOwnerId(userId);
		order.setStatus("1");
		order.setUpdateTime(new Date());
		int result = orderMapper.insertOrder(order);
		return result;
	}

	/**
	 * 根据物主id和订单状态查询订单
	 */
	@Override
	public List<Order> selectOrderByUserIdAndOrderStatus(Map<String, Object> paramsMap) {
		List<Order> orderList = orderMapper.selectOrderByUserIdAndOrderStatus(paramsMap);
		return orderList;
	}
	
}
