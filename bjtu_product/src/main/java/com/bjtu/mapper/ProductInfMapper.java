package com.bjtu.mapper;

import org.apache.ibatis.annotations.Param;

import com.bjtu.entity.P_PRODUCTIFO;

public interface ProductInfMapper {
	
	//根据id查询商品
	public P_PRODUCTIFO selectProductInfById(@Param("product_id")int product_id);
	
}
