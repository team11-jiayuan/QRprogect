package com.bjtu.mapper;

import java.util.HashMap;
import java.util.List;

import com.bjtu.entity.OBJECT_PRODUCT;
import com.bjtu.entity.P_IMAGE;
import com.bjtu.entity.P_PRODUCT;
import com.bjtu.entity.P_PRODUCTIFO;

public interface ProductMapper {
	
	//插入商品
	public void insert_product(P_PRODUCT product);
	
	//插入商品信息
	public void insert_productinf(P_PRODUCTIFO product_ifo);
	
	//插入商品图片
	public void insert_image(HashMap<Object, Object> map);
	
	//根据分类编号查询商品
	public List<P_PRODUCT> select_products(int class_id);
	
	//根据分类编号查询商品
	public OBJECT_PRODUCT select_product_detail(int product_id);
	
	//查询所有商品
	public List<P_PRODUCT> select_all_products();
	
	

}
