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

	/**
	 * 同意租赁
	 * @param orderId
	 */
	public int agreeRent(String orderId);

	/**
	 * 拒绝租赁
	 * @param orderId
	 */
	public int disagreeRent(String orderId);

	/**
	 * 承租人确认被拒绝租赁的消息
	 * @param orderId
	 * @return
	 */
	public int affirmDisagree(String orderId);

	/**
	 * 支付订单
	 * @param orderId
	 * @return
	 */
	public int payForTheOrder(String orderId);

	/**
	 * 确认收到物品
	 * @param orderId
	 */
	public int receive(String orderId);

	/**
	 * 申请提前归还物品
	 * @param orderId
	 * @return
	 */
	public int earlyReturn(String orderId);

	/**
	 * 拒绝提前归还物品
	 * @param orderId
	 * @return
	 */
	public int disagreeEarlyReturn(String orderId);

	/**
	 * 承租人确认被拒绝提前归还物品的消息
	 * @param orderId
	 */
	public int affirmDisagreeEarlyReturn(String orderId);

	/**
	 * 同意提前归还物品
	 * @param orderId
	 * @return
	 */
	public int agreeEarlyReturn(String orderId);

	/**
	 * 物主确认收到提前归还的物品
	 * @param orderId
	 * @return
	 */
	public int receiveEarlyReturn(String orderId);

	/**
	 * 承租人确认已归还提前归还的物品
	 * @param orderId
	 */
	public int affirmEarlyReturn(String orderId);

	/**
	 * 承租人确认收到押金和租金，订单完成
	 * @param orderId
	 * @return
	 */
	public int affirmReceiveDeposit(String orderId);

	/**
	 * 物主返还押金和租金
	 * @param orderId
	 * @return
	 */
	public int returnDeposit(String orderId);

	/**
	 * 申请延长租期
	 * @param orderId
	 * @return
	 */
	public int extendRent(String orderId);

	/**
	 * 确认延长日期
	 * @param orderId
	 * @param extendDate
	 * @return
	 */
	public int affirmExtendDate(String orderId, Integer extendDate);

	/**
	 * 拒绝延长租期
	 * @param orderId
	 * @return
	 */
	public int disagreeExtend(String orderId);

	/**
	 * 同意延长租期
	 * @param orderId
	 * @return
	 */
	public int agreeExtend(String orderId);

	/**
	 * 支付延长使用租金
	 * @param orderId
	 */
	public int paymentExtend(String orderId);

}
