package com.quezu.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.quezu.pojo.Product;
import com.quezu.pojo.User;
import com.quezu.service.ImageService;
import com.quezu.service.OrderService;
import com.quezu.service.ProductService;
import com.quezu.util.FileUploadUtil;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * 发布物品
	 * @param product
	 * @param files
	 * @param session
	 * @return
	 */
	@RequestMapping("publishProduct")
	public String publish(Product product, @RequestParam("files") MultipartFile[] files, HttpSession session) {
		//物品id
		String productId = UUID.randomUUID().toString().replaceAll("-", "");
		product.setId(productId);
		//用户id
		Integer userId = ((User)session.getAttribute("currentUser")).getId();
		product.setUserId(userId);
		//将物品图片存到本地文件系统，并获得图片文件名List
		List<String> imageList = FileUploadUtil.imageHandler(files);
		//首选图片文件名
		product.setPrimaryImg(imageList.get(0));
		//发布时间
		product.setPublishTime(new Date());
		productService.insertProduct(product);
		imageService.insertImages(imageList, productId);
		orderService.inertOrder(productId, userId);
		return "redirect:rentOut";
	}
	
}
