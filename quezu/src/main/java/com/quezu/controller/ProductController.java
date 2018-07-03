package com.quezu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	 * 修改物品信息页面
	 * @param session
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping("updateProduct/{productId}")
	public String updateProduct(HttpSession session, ModelMap model, @PathVariable String productId) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			model.addAttribute("toPage", "toupdateProduct/"+productId);
			return "home";
		}else {
			return "login";
		}
	}
	
	/**
	 * iframe修改物品信息页面
	 * @return
	 */
	@RequestMapping("toupdateProduct/{productId}")
	public String toupdateProduct(ModelMap model, @PathVariable String productId) {
		Product product = productService.selectProductByProductId(productId);
		List<Image> imageList = imageService.selectImagesByProductId(productId);
		model.addAttribute("imageList", imageList);
		model.addAttribute("product", product);
		return "product/updateProduct";
	}
	
	/**
	 * 根据关键字模糊查询物品
	 * @return
	 */
	@RequestMapping("searchByKeyWord/{keyWord}")
	public String searchByKeyWord(@PathVariable String keyWord, ModelMap model) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		//订单状态
		List<Integer> orderStatusList = new ArrayList<Integer>();
		orderStatusList.add(1);
		paramsMap.put("orderStatusList", orderStatusList);
		//关键字
		paramsMap.put("keyWord", keyWord);
		List<Product> productList = productService.selectProductByParamsMap(paramsMap);
		model.addAttribute("productList", productList);
		return "searchResult";
	}
	
	/**
	 * 根据分类查询物品
	 * @return
	 */
	@RequestMapping("searchByCategory/{category}")
	public String searchByCategory(@PathVariable String category, ModelMap model) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		//订单状态
		List<Integer> orderStatusList = new ArrayList<Integer>();
		orderStatusList.add(1);
		paramsMap.put("orderStatusList", orderStatusList);
		//物品分类
		paramsMap.put("category", category);
		List<Product> productList = productService.selectProductByParamsMap(paramsMap);
		model.addAttribute("productList", productList);
		return "searchResult";
	}
	
	/**
	 * 根据子类查询物品
	 * @return
	 */
	@RequestMapping("searchBySubCategory/{category}_{subCategory}")
	public String searchBySubCategory(@PathVariable String category, @PathVariable String subCategory, ModelMap model) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		//订单状态
		List<Integer> orderStatusList = new ArrayList<Integer>();
		orderStatusList.add(1);
		paramsMap.put("orderStatusList", orderStatusList);
		//物品分类
		paramsMap.put("category", category);
		//物品子类
		paramsMap.put("subCategory", subCategory);
		List<Product> productList = productService.selectProductByParamsMap(paramsMap);
		model.addAttribute("productList", productList);
		return "searchResult";
	}
	
	/**
	 * 发布物品
	 * @param product
	 * @param files
	 * @param session
	 * @return
	 */
	@RequestMapping("publishProduct")
	public String publish(Product product, @RequestParam("files") MultipartFile[] files, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			//物品id
			String productId = UUID.randomUUID().toString().replaceAll("-", "");
			product.setId(productId);
			//用户id
			Integer userId = user.getId();
			product.setUserId(userId);
			//将物品图片存到本地文件系统，并获得图片文件名List
			List<String> imageList = FileUploadUtil.imageListHandler(files);
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
		}else {
			return "login";
		}
	}
	
	/**
	 * 修改物品信息
	 * @param product
	 * @param files
	 * @param session
	 * @return
	 */
	@RequestMapping("updateProduct")
	public String updateProduct(Product product, @RequestParam("files") MultipartFile[] files, Integer[] imagesId, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		if(user != null) {
			if(imagesId != null) {
				List<String> imageList = new ArrayList<String>();
				for(int i=0; i<files.length; i++) {
					if(i < imagesId.length && files[i].getSize()!=0) {
						String imgURL = FileUploadUtil.imageHandler(files[i]);
						if(i == 0) {
							product.setPrimaryImg(imgURL);
						}
						Image image = new Image();
						image.setId(imagesId[i]);
						image.setUrl(imgURL);
						imageService.updateImageById(image);
					}else if(i >= imagesId.length && files[i].getSize()!=0) {
						String imgURL = FileUploadUtil.imageHandler(files[i]);
						imageList.add(imgURL);
					}
				}
				imageService.insertImages(imageList, product.getId());
			}else {
				//将物品图片存到本地文件系统，并获得图片文件名List
				List<String> imageList = FileUploadUtil.imageListHandler(files);
				//首选图片文件名
				if(imageList.size()!=0) {
					product.setPrimaryImg(imageList.get(0));
				}
				imageService.insertImages(imageList, product.getId());
			}
			product.setUpdateTime(new Date());
			productService.updateProductById(product);
			return "redirect:rentOut";
		}else {
			return null;
		}
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
		User user = (User)session.getAttribute("currentUser");
		if(user != null && user.getId().intValue() == order.getOwnerId().intValue()) {
			return "myProductDetail";
		} else {
			return "productDetail";
		}
	}
	
}
