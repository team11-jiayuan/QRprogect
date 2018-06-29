package com.quezu.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.quezu.pojo.Image;
import com.quezu.pojo.Order;
import com.quezu.pojo.Product;
import com.quezu.pojo.User;
import com.quezu.service.ImageService;
import com.quezu.service.OrderService;
import com.quezu.service.ProductService;
import com.quezu.service.UserService;
import com.quezu.util.FileUploadUtil;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
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
		if(imageList.size()!=0) {
			product.setPrimaryImg(imageList.get(0));
		}
		//发布时间
		product.setPublishTime(new Date());
		productService.insertProduct(product);
		imageService.insertImages(imageList, productId);
		orderService.inertOrder(productId, userId);
		return "redirect:rentOut";
	}
	
	/**
	 * 物品详情
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("productDetail/{orderId}")
	public String productDetail(@PathVariable String orderId, ModelMap model, HttpSession session) {
		//订单信息
		Order order = orderService.selectOrderByOrderId(orderId);
		String productId = order.getProductId();
		//物品信息
		Product product = productService.selectProductByProductId(productId);
		//物品图片
		List<Image> imageList = imageService.selectImagesByProductId(productId);
		//物主信息
		User owner = userService.selectUserById(order.getOwnerId());
		model.addAttribute("order", order);
		model.addAttribute("product", product);
		model.addAttribute("imageList", imageList);
		model.addAttribute("owner", owner);
		if(order.getOwnerId().intValue() == ((User)session.getAttribute("currentUser")).getId().intValue()) {
			return "myProductDetail";
		} else {
			return "productDetail";
		}
	}
	
}
