package com.quezu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quezu.mapper.ImageMapper;
import com.quezu.pojo.Image;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageMapper imageMapper;
	
	/**
	 * 插入物品图片
	 */
	@Override
	public void insertImages(List<String> imageList, String productId) {
		Image img = new Image();
		img.setProductId(productId);
		for(String image : imageList) {
			img.setUrl(image);
			imageMapper.insertImage(img);
		}
	}

	/**
	 * 根据物品id查询物品图片
	 */
	@Override
	public List<Image> selectImagesByProductId(String productId) {
		List<Image> imageList = imageMapper.selectImagesByProductId(productId);
		return imageList;
	}

	

}
