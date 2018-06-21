package com.quezu.mapper;

import com.quezu.pojo.User;

public interface UserMapper {
	
	/**
	 * 插入用户数据
	 * @param user
	 */
	public int insert(User user);

	/**
	 * 根据用户名查找用户
	 * @param userName
	 * @return
	 */
	public User selectUserByUsername(String userName);
	
}
