package com.bjtu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjtu.entity.Order;
import com.bjtu.entity.P_PRODUCT;
import com.bjtu.entity.P_PRODUCTIFO;
import com.bjtu.mapper.OrderMapper;
import com.bjtu.mapper.ProductInfMapper;
import com.bjtu.mapper.ProductMapper;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
//	@Autowired
//	private ProductInfMapper productInfMapper;
	
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

	/**
	 * 用户下单
	 * @param id
	 * @param product_id
	 * @param days
	 */
	public void rent(int userId, Integer product_id, Integer days) {
		P_PRODUCT product = productMapper.selectProductById(product_id);
//		P_PRODUCTIFO productInf = productInfMapper.selectProductInfById(product_id);
		Order order = new Order();
		order.setCustomer_id(userId);
		order.setShp_id(product_id);
		order.setOrder_zt("1");
		order.setUser_id(product.getYh_id());
		order.setShp_mch(product.getShp_mch());
		order.setShp_tp(product.getShp_tp());
		orderMapper.insertOrder(order);
	}
	
}
