package com.bjtu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bjtu.entity.Msg;
import com.bjtu.entity.OBJECT_PRODUCT;
import com.bjtu.entity.P_IMAGE;
import com.bjtu.entity.P_PRODUCT;
import com.bjtu.entity.P_PRODUCTIFO;
import com.bjtu.entity.U_USER;
import com.bjtu.service.ProductService;
import com.bjtu.util.MyFileUploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	// 跳转至商品首页
	/*
	 * @RequestMapping("product_index") public String toProductIndex(ModelMap
	 * map) {
	 * 
	 * List<P_PRODUCT> all_product=productService.getAllProduct();
	 * map.put("all_product", all_product); return "product_index"; }
	 */

	//带分页的商品首页
	@RequestMapping("product_index")
	public String toProductIndex(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 12);
		
		// startPage后面紧跟的这个查询就是一个分页查询
		List<P_PRODUCT> all_product = productService.getAllProduct();
		
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(all_product, 6);

		model.addAttribute("pageInfo", page);

		return "product_index";
	}
	
	// 跳转至商品发布页面
	@RequestMapping("p_publish")
	public String toPublish(HttpSession session) {
		U_USER user = (U_USER) session.getAttribute("user");
		if (user != null) {
			return "publish";
		} else {
			return "login";
		}
	}

	// 商品发布
	@RequestMapping(value = "publish", method = RequestMethod.POST)
	public String productPublish(P_PRODUCTIFO product_ifo, P_PRODUCT product,
			@RequestParam("files") MultipartFile[] files, HttpSession session) {
		U_USER user = (U_USER) session.getAttribute("user");

		product.setYh_id(user.getId());
		product.setShp_zt(1);
		List<String> image_list = MyFileUploadUtil.imgs_upload(files);

		product.setShp_tp(image_list.get(0));

		productService.productPublish(product_ifo, product, image_list);

		return "publishSuccess";

	}

	// 商品查询
	@RequestMapping("searchProduct/{class_id}/{pn}")
	public String searchProduct(@PathVariable Integer class_id, @PathVariable Integer pn, Model model) {

		PageHelper.startPage(pn,12);
		
		List<P_PRODUCT> products = productService.getProducts(class_id);
		
		PageInfo page = new PageInfo(products, 6);

		model.addAttribute("pageInfos", page);
		model.addAttribute("class_id",class_id);
		return "product_index";
	}

	// 转发至商品详情页面
	@RequestMapping("to_product_detail/{product_id}")
	public String toProductDetail(@PathVariable int product_id, ModelMap map) {
		OBJECT_PRODUCT object_product = productService.getProductDetail(product_id);
		List<P_IMAGE> images = object_product.getImages();
		List<P_IMAGE> images_new = images.subList(0, images.size() - 1);
		object_product.setImage(images_new);
		map.put("object_product", object_product);
		return "product_detail";

	}

}