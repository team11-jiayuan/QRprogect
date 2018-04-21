package com.bjtu.mapper;

import java.util.HashMap;
import java.util.Map;

import com.bjtu.entity.OBJECT_ADDRESS;
import com.bjtu.entity.S_CITY;
import com.bjtu.entity.S_DISTRICT;
import com.bjtu.entity.S_PROVINCE;
import com.bjtu.entity.U_ADDRESS;
import com.bjtu.entity.U_USER;

public interface UserMapper {
	
	//插入用户信息
	public void addUser(U_USER user);
	
	//插入地址信息
	public void addAddress(HashMap<Object,Object> hashMap);
	
	//根据用户名和密码查询用户
	public U_USER getUser(U_USER user);
	
	//根据用户id查询用户
	public U_USER getUserById(int id);
	
	//根据用户id查询地址
	public U_ADDRESS getAddress(int id);
	
	//根据id查询省
	public S_PROVINCE getProvince(int id);
	
	//根据id查询市
	public S_CITY getCity(int id);
	
	//根据id查询区
	public S_DISTRICT getDistrict(int id);
	
	//跟新用户信息
	public void updateUser(OBJECT_ADDRESS user);
	
	//跟新地址信息
	public void updateAddress(OBJECT_ADDRESS user);
	
	//插入用户头像
	public void uploadHead(HashMap<Object, Object> map);

}
