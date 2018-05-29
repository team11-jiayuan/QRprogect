package com.bjtu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjtu.entity.Order;
import com.bjtu.mapper.OrderMapper;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	/**
	 * 根据用户id和订单状态查询订单
	 * @param userId
	 * @param order_zt
	 * @return
	 */
	public List<Order> selectOrderByUserIdAndOrderZt(int userId, String order_zt){
		List<Order> orderList = orderMapper.selectOrderByUserIdAndOrderZt(userId, order_zt);
		return orderList;
	}
	
}
