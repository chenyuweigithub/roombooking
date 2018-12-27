package com.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;








import com.opensymphony.xwork2.ActionSupport;
import com.service.impl.IUserService;
import com.vo.User;

public class LoginAction extends ActionSupport {
	private User user;
	
	private IUserService userService;


	public String register(){
		User u=new User(user.getUsername(),user.getPassword(),user.getPhone(),user.getUsertype());
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("user",u);
		if(userService.registerUser(u)!=null)
		{
			session.setAttribute("validated", true);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String execute() throws Exception{
		boolean validated=false;			
		User u=userService.validateUser(user.getUsername(), user.getPassword());
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("user",u);
		if(u!=null)
		{
			validated=true;			
		}
		System.out.print(validated);
		if(validated)
		{
			session.setAttribute("validated", true);
			return "success";
		}
		else
		{
			return "error";
		}
	}
	
	public String logout(){
		user.setUsername("");
		user.setPassword("");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("user",null);
		System.out.println(user.getUsername());
		return "success";
	}
	
	public String updatepwd(){
		boolean validated=false;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		validated = userService.updatapwd(user.getUsername(),user.getPassword(),user.getNewpassword());
		if(validated)
		{
			session.setAttribute("validated", validated);
			return "success";
		}
		else
		{
			
			session.setAttribute("validated", validated);
			return "error";
		}	
	}
	
	public String updateMessage(){
		boolean validated=false;
		System.out.println(user.getUserid());
		Integer UserId =user.getUserid();
		validated = userService.updateMessage(user.getUserid(), user.getPhone(), user.getSex(), user.getAge(), user.getSign());
		if(validated)
		{
			User u=userService.getuserbyid(UserId);
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("user",u);
			return "success";
		}
		else
		{
			return "error";
		}
		
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
}
