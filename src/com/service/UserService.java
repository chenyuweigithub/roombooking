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
	
	//ʵ��ֱ�ӣ�����֤���ĵ�¼���������������˺ŵ��û�
	public User validateUser(String username,String password){
		return userDAO.validateUser(username, password);
	}

	public User registerUser(User user){
		//��������ҵ��Ҫ����ע�ᡢ��֤�����׶Σ��Ⱥ�ʹ��userDAO�ӿڵ���������
		boolean b = userDAO.saveUser(user);			//��ע����˺���Ϣд�����ݿ�
		//�漴��ʼ��֤
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
