package com.quezu.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
		product.setUpdateTime(new Date());
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

	/**
	 * 根据参数查询物品信息
	 */
	@Override
	public List<Product> selectProductByParamsMap(Map<String, Object> paramsMap) {
		List<Product> productList = productMapper.selectProductByParamsMap(paramsMap);
		return productList;
	}

	/**
	 * 根据id更新物品信息
	 */
	@Override
	public int updateProductById(Product product) {
		int result = productMapper.updateProductById(product);
		return result;
	}

}
