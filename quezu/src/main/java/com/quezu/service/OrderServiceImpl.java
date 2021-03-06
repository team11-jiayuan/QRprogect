package com.quezu.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quezu.mapper.OrderMapper;
import com.quezu.mapper.ProductMapper;
import com.quezu.pojo.Order;
import com.quezu.pojo.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;

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
		order.setStatus(1);
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

	/**
	 * 根据id取消订单
	 */
	@Override
	public int cancelOrderById(String orderId) {
		Order order = new Order();
		order.setId(orderId);
		order.setStatus(0);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 根据订单编号查询订单
	 */
	@Override
	public Order selectOrderByOrderId(String orderId) {
		Order order =orderMapper.selectOrderByOrderId(orderId);
		return order;
	}

	/**
	 * 申请租赁
	 */
	@Override
	public int applyRent(Order order) {
		order.setStatus(2);
		//设置截至日期
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 12);
		order.setStopTime(calendar.getTime());
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 同意租赁
	 */
	@Override
	public int agreeRent(String orderId) {
		Order order =orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(3);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 拒绝租赁
	 */
	@Override
	public int disagreeRent(String orderId) {
		Order order =orderMapper.selectOrderByOrderId(orderId);
		Product product = productMapper.selectProductByProductId(order.getProductId());
		//将当前订单状态置为13
		order.setStatus(13);
		order.setUpdateTime(new Date());
		orderMapper.updateOrderById(order);
		//生成新的订单记录
		Order ord = new Order();
		String ordId = UUID.randomUUID().toString().replaceAll("-", "");
		ord.setId(ordId);
		ord.setProductId(product.getId());
		ord.setOwnerId(order.getOwnerId());
		ord.setStatus(1);
		ord.setUpdateTime(new Date());
		orderMapper.insertOrder(ord);
		//更新物品信息
		product.setReservedField(ordId);
		product.setUpdateTime(new Date());
		int result = productMapper.updateProductById(product);
		return result;
	}

	/**
	 * 承租人确认被拒绝租赁的消息
	 */
	@Override
	public int affirmDisagree(String orderId) {
		Order order =orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(11);
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 支付订单
	 */
	@Override
	public int payForTheOrder(String orderId) {
		Order order =orderMapper.selectOrderByOrderId(orderId);
		Product product = productMapper.selectProductByProductId(order.getProductId());
		BigDecimal rent = product.getRent().multiply(BigDecimal.valueOf(order.getDaysOrMonths().intValue()));
		BigDecimal total = rent.add(product.getDeposit());
		order.setTotal(total);
		order.setStatus(4);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 确认收到物品
	 */
	@Override
	public int receive(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		Product product = productMapper.selectProductByProductId(order.getProductId());
		order.setStatus(5);
		Date date = new Date();
		order.setStartTime(date);
		//设置截至日期
		if("daily".equals(product.getRentMode())) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_MONTH, order.getDaysOrMonths());
			order.setStopTime(calendar.getTime());
		}else {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, order.getDaysOrMonths());
			order.setStopTime(calendar.getTime());
		}
		order.setUpdateTime(date);
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 申请提前归还物品
	 */
	@Override
	public int earlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(6);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 拒绝提前归还物品
	 */
	@Override
	public int disagreeEarlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(14);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 承租人确认被拒绝提前归还物品的消息
	 */
	@Override
	public int affirmDisagreeEarlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(5);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 同意提前归还物品
	 */
	@Override
	public int agreeEarlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(7);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 物主确认收到提前归还的物品
	 */
	@Override
	public int receiveEarlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(16);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 承租人确认已归还提前归还的物品
	 */
	@Override
	public int affirmEarlyReturn(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(15);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 承租人确认收到押金和租金，订单完成
	 */
	@Override
	public int affirmReceiveDeposit(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(10);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 物主返还押金和租金
	 */
	@Override
	public int returnDeposit(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(17);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 申请延长租期
	 */
	@Override
	public int extendRent(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(18);
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 确认延长日期
	 */
	@Override
	public int affirmExtendDate(String orderId, Integer extendDate) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(8);
		order.setExtendDate(extendDate);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 拒绝延长租期
	 */
	@Override
	public int disagreeExtend(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(19);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 同意延长租期
	 */
	@Override
	public int agreeExtend(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		order.setStatus(9);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

	/**
	 * 支付延长使用租金
	 */
	@Override
	public int paymentExtend(String orderId) {
		Order order = orderMapper.selectOrderByOrderId(orderId);
		Product product = productMapper.selectProductByProductId(order.getProductId());
		order.setStatus(5);
		BigDecimal rent = product.getRent().multiply(BigDecimal.valueOf(order.getExtendDate().intValue()));
		BigDecimal total = rent.add(order.getTotal());
		order.setTotal(total);
		Date date = order.getStopTime();
		if("daily".equals(product.getRentMode())) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_MONTH, order.getExtendDate());
			order.setStopTime(calendar.getTime());
		}else {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, order.getExtendDate());
			order.setStopTime(calendar.getTime());
		}
		order.setDaysOrMonths(order.getDaysOrMonths()+order.getExtendDate());
		order.setExtendDate(0);
		order.setUpdateTime(new Date());
		int result = orderMapper.updateOrderById(order);
		return result;
	}

}
