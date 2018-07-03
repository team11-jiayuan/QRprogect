package com.quezu.service;

import java.util.List;
import java.util.Map;

import com.quezu.pojo.Product;

public interface ProductService {
	
	/**
	 * 插入物品信息
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product);

	/**
	 * 根据物品id查询物品
	 * @param productId
	 * @return
	 */
	public Product selectProductByProductId(String productId);

	/**
	 * 根据参数查询物品信息
	 * @param paramsMap
	 * @return
	 */
	public List<Product> selectProductByParamsMap(Map<String, Object> paramsMap);

	/**
	 * 根据id更新物品信息
	 * @param product
	 * @return
	 */
	public int updateProductById(Product product);
	
}
