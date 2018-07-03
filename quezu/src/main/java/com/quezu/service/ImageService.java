package com.quezu.service;

import java.util.List;

import com.quezu.pojo.Image;

public interface ImageService {
	
	/**
	 * 插入物品图片
	 * @param imageList
	 * @return
	 */
	public void insertImages(List<String> imageList, String productId);

	/**
	 * 根据物品id查询物品图片
	 * @param productId 
	 * @return
	 */
	public List<Image> selectImagesByProductId(String productId);

	/**
	 * 根据id更新物品图片
	 * @param integer
	 */
	public int updateImageById(Image image);
	
}
