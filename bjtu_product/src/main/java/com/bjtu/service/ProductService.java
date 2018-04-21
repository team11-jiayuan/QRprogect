package com.bjtu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjtu.entity.OBJECT_PRODUCT;
import com.bjtu.entity.P_PRODUCT;
import com.bjtu.entity.P_PRODUCTIFO;
import com.bjtu.mapper.ProductMapper;
import com.bjtu.mapper.UserMapper;

@Service
public class ProductService {

	@Autowired
	ProductMapper productMapper;

	//商品发布
	public void productPublish(P_PRODUCTIFO product_ifo, P_PRODUCT product, List<String> image_list) {
		
		//插入商品
		productMapper.insert_product(product);
		int shp_id=product.getId();
		
		//插入商品信息
		product_ifo.setShp_id(shp_id);
		productMapper.insert_productinf(product_ifo);
		
		//插入图片
		HashMap<Object,Object> map=new HashMap<Object,Object>();
		map.put("shp_id", shp_id);
		map.put("img_list", image_list);
		productMapper.insert_image(map);
		

	}
	
	//根据分类编号查询商品
	public List<P_PRODUCT> getProducts(int class_id){
		List<P_PRODUCT> products=productMapper.select_products(class_id);
		return products;
		
	}
	
	//根据商品id查询商品详情
	public OBJECT_PRODUCT getProductDetail(int product_id){
		OBJECT_PRODUCT object_product = productMapper.select_product_detail(product_id);
		return object_product;
	}
	
	//查询所有商品
	public List<P_PRODUCT> getAllProduct(){
		List<P_PRODUCT> all_products=productMapper.select_all_products();
		return all_products;
	}
	
	

}
