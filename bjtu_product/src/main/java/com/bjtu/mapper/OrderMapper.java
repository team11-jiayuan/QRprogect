package com.bjtu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bjtu.entity.Order;

public interface OrderMapper {

	public List<Order> selectOrderByUserIdAndOrderZt(@Param("userId")int userId, @Param("order_zt")String order_zt);
	
	public int insertOrder(Order order);

}
