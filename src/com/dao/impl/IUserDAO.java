package com.dao.impl;

import com.vo.User;

public interface IUserDAO {
	public boolean saveUser(User user);
	public User validateUser(String username,String password);
	public boolean updatepwd(String username,String password,String newpassword);
	public boolean exitUser(String username);
	public boolean updateMessage(Integer userid,String phone,Integer sex,Integer age,String sign);
	public User getuserbyid(Integer userid);
}
