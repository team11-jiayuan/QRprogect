package com.quezu.mapper;

import com.quezu.pojo.Product;

public interface ProductMapper {

	/**
	 * 插入物品信息
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product);

}
