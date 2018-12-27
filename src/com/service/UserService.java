package com.service;

import com.dao.impl.IUserDAO;
import com.service.impl.IUserService;
import com.vo.User;


public class UserService implements IUserService{
	private IUserDAO userDAO;
	
	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//实现直接（仅验证）的登录服务，适用于已有账号的用户
	public User validateUser(String username,String password){
		return userDAO.validateUser(username, password);
	}

	public User registerUser(User user){
		//由于这项业务要经过注册、验证两个阶段，先后使用userDAO接口的两个方法
		boolean b = userDAO.saveUser(user);			//把注册的账号信息写入数据库
		//随即开始验证
		if(b==true)
		return userDAO.validateUser(user.getUsername(), user.getPassword());
		//userDAO.validateUser(user.getUsername(), user.getPassword());
		else 
		return null;
	}
	
	public boolean exitUser(String username){
		return userDAO.exitUser(username);
	}
	
	public boolean updatapwd(String username, String password, String newpassword) {	
		return userDAO.updatepwd(username, password, newpassword);
		// TODO Auto-generated method stub
	}
	public boolean updateMessage(Integer userid,String phone,Integer sex,Integer age,String sign){
		return userDAO.updateMessage(userid, phone, sex, age, sign);
	}
	public User getuserbyid(Integer userid){
		return userDAO.getuserbyid(userid);
	}

}
