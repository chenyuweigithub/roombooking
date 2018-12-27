package com.service.impl;

import com.vo.User;

public interface IUserService {
	public User registerUser(User user);
	public User validateUser(String username,String password);
	public boolean updatapwd(String username, String password, String newpassword);
	public boolean exitUser(String username);
	public boolean updateMessage(Integer userid,String phone,Integer sex,Integer age,String sign);
	public User getuserbyid(Integer userid);
}
