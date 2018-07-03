package com.quezu.mapper;

import java.util.List;

import com.quezu.pojo.Image;

public interface ImageMapper {

	/**
	 * 插入物品图片
	 * @param imageList
	 * @return
	 */
	public int insertImage(Image image);

	/**
	 * 根据物品id查询物品图片
	 * @param productId
	 * @return
	 */
	public List<Image> selectImagesByProductId(String productId);

	/**
	 * 根据id更新物品图片
	 * @param imageId
	 * @return
	 */
	public int updateImageById(Image image);
	
}
