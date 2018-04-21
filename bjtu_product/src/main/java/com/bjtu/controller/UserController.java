package com.bjtu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bjtu.entity.Msg;
import com.bjtu.entity.OBJECT_ADDRESS;
import com.bjtu.entity.PROVINCE_CITY_DISTRICT_PHONE;
import com.bjtu.entity.S_CITY;
import com.bjtu.entity.S_DISTRICT;
import com.bjtu.entity.S_PROVINCE;
import com.bjtu.entity.U_ADDRESS;
import com.bjtu.entity.U_USER;
import com.bjtu.service.UserService;
import com.bjtu.util.MD5Utils;
import com.bjtu.util.MyFileUploadUtil;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	// 转发至注册页面
	@RequestMapping("toregist")
	public String toregist() {
		return "regist";
	}

	// 转发至网站介绍页面
	@RequestMapping("readme")
	public String toReadMe() {
		return "readme";
	}

	// 转发至登陆页面
	@RequestMapping("tologin")
	public String tologin() {
		return "login";
	}

	// 用户注册
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String regist(U_USER user, U_ADDRESS address) {
		userService.add(user, address);
		return "redirect:tologin.do";
	}

	// 用户登陆
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(U_USER user, HttpSession session, Model model) {

		U_USER user_login = userService.getUser(user);
		if (user_login != null) {
			// String psdString = MD5Utils.getMD5String(user.getYh_mm());
			// user_login.setYh_mm(psdString);
			boolean isEqual = MD5Utils.isEqualsToMd5(user.getYh_mm(), user_login.getYh_mm());
			if (isEqual) {
				session.setAttribute("user", user_login);
				// return "redirect:/index.jsp";
				return "redirect:product_index.do";
			} else {
				model.addAttribute("errors", "用户名或密码错误！");
				return "forward:tologin.do";
			}
		} else {
			model.addAttribute("errors", "用户名不存在！");
			return "forward:tologin.do";
		}
	}

	// 跳转至用户管理页面
	@RequestMapping("userManage")
	public String UserManage(HttpSession session, Model model) {

		U_USER user = (U_USER) session.getAttribute("user");
		if (user != null) {

			HashMap<String, Object> map = userService.getAddress(user);
			model.addAttribute("phone", map.get("phone"));
			model.addAttribute("province", map.get("province"));
			model.addAttribute("city", map.get("city"));
			model.addAttribute("district", map.get("district"));

			return "usermanage";
		} else {
			return "login";
		}
	}

	// 修改用户信息时在模态框回显用户信息
	@RequestMapping("userManage_json")
	@ResponseBody
	public Msg UserManage_json(HttpSession session) {

		U_USER user = (U_USER) session.getAttribute("user");

		HashMap<String, Object> map = userService.getAddress(user);
		S_PROVINCE province = (S_PROVINCE) map.get("province");
		S_CITY city = (S_CITY) map.get("city");
		S_DISTRICT district = (S_DISTRICT) map.get("district");

		PROVINCE_CITY_DISTRICT_PHONE addr = new PROVINCE_CITY_DISTRICT_PHONE();

		addr.setProvince(province.getProvinceName());
		addr.setCity(city.getCityName());
		addr.setDistrict(district.getDistrictName());
		addr.setPhone(map.get("phone").toString());

		return Msg.success().add("addr", addr);
	}

	// 更新用户信息
	@RequestMapping("updateUser")
	public String updateUser(OBJECT_ADDRESS address, HttpSession session) {

		U_USER user = (U_USER) session.getAttribute("user");
		address.setUser_id(user.getId());

		userService.updateUser(address);

		U_USER user_update = userService.getUserById(user.getId());

		session.setAttribute("user", user_update);

		return "forward:userManage.do";
	}

	// 退出登陆
	@RequestMapping("logout")
	public String outLogin(HttpSession session) {
		session.invalidate();
		return "redirect:product_index.do";

	}

	// 上传头像
	@RequestMapping(value = "uploadHead", method = RequestMethod.POST)
	public String uploadHead(Model model, HttpSession session, @RequestParam("files") MultipartFile[] files)
			throws Exception {
		U_USER user = (U_USER) session.getAttribute("user");
		List<String> image_list = MyFileUploadUtil.imgs_upload(files);
		String image = image_list.get(0);
		userService.uploadHead(user.getId(), image);
		// 重新根据id查询用户
		U_USER user_tx = userService.getUserById(user.getId());
		model.addAttribute("image", image);
		session.setAttribute("user", user_tx);
		//return "redirect:userManage.do";
		return "publishSuccess";
	}

	// 上传头像
	@RequestMapping(value = "uploadHead_json", method = RequestMethod.POST)
	@ResponseBody
	public String uploadHead_json(Model model, HttpSession session, @RequestParam("files") MultipartFile[] files)
			throws Exception {
		U_USER user = (U_USER) session.getAttribute("user");
		List<String> image_list = MyFileUploadUtil.imgs_upload(files);
		String image = image_list.get(0);
		userService.uploadHead(user.getId(), image);
		// 重新根据id查询用户
		U_USER user_tx = userService.getUserById(user.getId());
		model.addAttribute("image", image);
		session.setAttribute("user", user_tx);
		return image;
	}

}
