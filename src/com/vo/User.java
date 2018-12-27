package com.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String password;
	private Integer usertype;
	private String phone;
	private Integer sex;
	private Integer age;
	private String sign;
	private Set orders = new HashSet(0);
	private Set rooms = new HashSet(0);
	private Set comments = new HashSet(0);
	private String newpassword;

	// Constructors

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}


	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password, Integer usertype) {
		this.username = username;
		this.password = password;
		this.usertype = usertype;
	}
	
	public User(String username, String password,String phone, Integer usertype) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.usertype = usertype;
		
	}

	/** full constructor */
	public User(String username, String password, Integer usertype,
			String phone, Integer sex, Integer age, String sign, Set orders,
			Set rooms, Set comments) {
		this.username = username;
		this.password = password;
		this.usertype = usertype;
		this.phone = phone;
		this.sex = sex;
		this.age = age;
		this.sign = sign;
		this.orders = orders;
		this.rooms = rooms;
		this.comments = comments;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUsertype() {
		return this.usertype;
	}

	public void setUsertype(Integer usertype) {
		this.usertype = usertype;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSign() {
		return this.sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getRooms() {
		return this.rooms;
	}

	public void setRooms(Set rooms) {
		this.rooms = rooms;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}