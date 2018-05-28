package com.bjtu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjtu.entity.U_USER;
import com.bjtu.service.UserService;

@Controller
public class RentController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("MyProductManager")
	public String myProductManager(HttpSession session, Model model) {
		U_USER user = (U_USER) session.getAttribute("user");
		if (user != null) {

//			HashMap<String, Object> map = userService.getAddress(user);
//			model.addAttribute("phone", map.get("phone"));
//			model.addAttribute("province", map.get("province"));
//			model.addAttribute("city", map.get("city"));
//			model.addAttribute("district", map.get("district"));

			return "myproduct";
		} else {
			return "login";
		}
	}
	
}
