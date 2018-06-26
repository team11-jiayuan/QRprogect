package com.quezu.service;

import com.quezu.pojo.Product;

public interface ProductService {
	
	/**
	 * 插入物品信息
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product);
	
}
