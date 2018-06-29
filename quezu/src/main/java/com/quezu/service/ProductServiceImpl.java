package com.quezu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quezu.mapper.ProductMapper;
import com.quezu.pojo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	/**
	 * 插入物品信息
	 */
	@Override
	public int insertProduct(Product product) {
		int result = productMapper.insertProduct(product);
		return result;
	}

	/**
	 * 根据物品id查询物品
	 */
	@Override
	public Product selectProductByProductId(String productId) {
		Product product = productMapper.selectProductByProductId(productId);
		return product;
	}

}
