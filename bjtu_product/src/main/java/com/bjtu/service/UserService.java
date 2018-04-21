package com.bjtu.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjtu.entity.OBJECT_ADDRESS;
import com.bjtu.entity.S_CITY;
import com.bjtu.entity.S_DISTRICT;
import com.bjtu.entity.S_PROVINCE;
import com.bjtu.entity.U_ADDRESS;
import com.bjtu.entity.U_USER;
import com.bjtu.mapper.UserMapper;
import com.bjtu.util.MD5Utils;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	//插入用户和地址信息
	public void add(U_USER user,U_ADDRESS address){
		//插入用户，返回user主键
		user.setYh_mm(MD5Utils.getMD5String(user.getYh_mm()));
		userMapper.addUser(user);
		//插入地址信息
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("user_id", user.getId());
		hashMap.put("address", address);
		userMapper.addAddress(hashMap);
	}
	
	//根据用户昵称和密码查询用户
	public U_USER getUser(U_USER user){
		U_USER user_login=userMapper.getUser(user);
		return user_login;
	}
	
	//根据用户id查询用户
	public U_USER getUserById(int id){
		U_USER user=userMapper.getUserById(id);
		return user;
	}
	
	//根据用户id查询地址信息
	public HashMap<String,Object> getAddress(U_USER user){
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		
		U_ADDRESS address=userMapper.getAddress(user.getId());
		
		S_PROVINCE province=userMapper.getProvince(address.getProvince_id());
		
		S_CITY city=userMapper.getCity(address.getCity_id());
		
		S_DISTRICT district=userMapper.getDistrict(address.getDistrict_id());
		
		map.put("phone", address.getPhone());
		map.put("province", province);
		map.put("city", city);
		map.put("district", district);		
		return map;
		
	}
	
	public void updateUser(OBJECT_ADDRESS user){
		userMapper.updateUser(user);
		userMapper.updateAddress(user);
	}
	
	//插入用户头像
	public void uploadHead(int user_id,String image){
		HashMap<Object, Object> map=new HashMap<Object,Object>();
		map.put("user_id", user_id);
		map.put("image", image);
		
		userMapper.uploadHead(map);
			
	}

}
