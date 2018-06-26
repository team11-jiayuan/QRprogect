package com.quezu.service;

import java.util.List;

public interface ImageService {
	
	/**
	 * 插入物品图片
	 * @param imageList
	 * @return
	 */
	public void insertImages(List<String> imageList, String productId);
	
}
