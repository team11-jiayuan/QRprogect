package com.quezu.service;

import com.quezu.pojo.User;

public interface UserService {

	/**
	 * 插入用户数据
	 * @param user
	 * @return
	 */
	public Boolean insert(User user);

	/**
	 * 根据用户名查找用户
	 * @param userName
	 * @return
	 */
	public User selectUserByUsername(String userName);
	
}
