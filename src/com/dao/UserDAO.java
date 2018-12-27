package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.impl.IUserDAO;
import com.vo.User;

public class UserDAO extends BaseDAO implements IUserDAO {
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	//登录 
	public User validateUser(String username,String password){		
		String sql="from User u where u.username=? and u.password=?";
		Session session=getSession();
		Query query=session.createQuery(sql);
		query.setParameter(0,username);
		query.setParameter(1,password);
		List users=query.list();
		if(users.size()!=0)
		{
			User user=(User)users.get(0);
			return user;
		}
		session.close();
		return null;
	}
	
	//查找表里面有没有该用户
	public boolean findUser(String username){		
		String sql="from User u where u.username=?";
		Session session=getSession();
		Query query=session.createQuery(sql);
		query.setParameter(0,username);
		List users=query.list();
		if(users.size()!=0)  //如果存在用户返回false
		{
			session.close();
			return false;
		}
		else
		{
			session.close();
			return true;
		}
	}
	
	public boolean exitUser(String username){
		Session session=getSession();
		String hql="from User u where u.username=? ";
		Query query=session.createQuery(hql);
		query.setParameter(0,username);
		List users=query.list();
		if(users.size()!=0){
			User user=(User)users.get(0);
			return true;
		}
		session.close();
		return false;
	}
	
	public boolean updateMessage(Integer userid,String phone,Integer sex,Integer age,String sign) {
		boolean validated = false;
		String sql="update User u set u.phone=?,u.sex=?,u.age=?,u.sign=? where u.userid=?";
		Session session=getSession();
		Query query=session.createQuery(sql);
		query.setParameter(0,phone);
		query.setParameter(1,sex);
		query.setParameter(2,age);
		query.setParameter(3,sign);
		query.setParameter(4,userid);
		query.executeUpdate();
		return true;
	}
	
	//注册
	public boolean saveUser(User user){
		boolean isunhasuser=false;
		if(findUser(user.getUsername())){
			isunhasuser=true;
		}
		System.out.print("save"+isunhasuser);
		
		if(isunhasuser==true){
		Session session=getSession();
		Transaction tx=session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
		return true;
		}
		else{
		return false;
		}
		
	}
	
	public User getuserbyid(Integer userid){
		String sql="from User u where u.userid=?";
		Session session=getSession();
		Query query=session.createQuery(sql);
		query.setParameter(0,userid);
		List users=query.list();
		if(users.size()!=0)
		{
			User user=(User)users.get(0);
			return user;
		}
		session.close();
		return null;
	}
	//修改密码
	public boolean updatepwd(String username,String password,String newpassword){
		boolean validated = false;
		User u=validateUser(username,password);
		if(u!=null)
		{
			validated=true;			//标识为true表示验证成功通过
		}
		System.out.print("up"+validated);
		if(validated)			//验证成功返回字符串"success"
		{
			String sql="update User u set u.password=? where u.username=?";
			Session session=getSession();
			Query query=session.createQuery(sql);
			query.setParameter(0,newpassword);
			query.setParameter(1,username);
			query.executeUpdate();
			return true;
		}
		else 			//验证失败返回字符串"error"
		{
			return false;
		}
	}
}
