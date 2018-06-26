package com.quezu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quezu.mapper.UserMapper;
import com.quezu.pojo.User;
import com.quezu.util.MD5Utils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 插入用户数据
	 */
	@Override
	public Boolean insert(User user) {
		//使用MD5将密码加密
		user.setPassword(MD5Utils.getMD5String(user.getPassword()));
		//设置默认头像
		user.setPhotograph("photograph.png");
		int result = userMapper.insert(user);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * 根据用户名查找用户
	 */
	@Override
	public User selectUserByUsername(String userName) {
		User user = userMapper.selectUserByUsername(userName);
		return user;
	}
	
	/**
	 * 根据ID查找用户
	 */
	@Override
	public User selectUserById(Integer id) {
		User user = userMapper.selectUserById(id);
		return user;
	}

	/**
	 * 根据ID更新用户
	 */
	@Override
	public Boolean updateUserById(User user) {
		int result = userMapper.updateUserById(user);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
	
}
