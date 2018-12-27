package com.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Room entity. @author MyEclipse Persistence Tools
 */

public class Room implements java.io.Serializable {

	// Fields

	private Integer roomid;
	private User user;
	private Catalog catalog;
	private String roomname;
	private String descriptive;
	private String img;
	private Integer price;
	private String equipmaent;
	private String rules;
	private String address;
	private Integer phone;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Room() {
	}

	/** full constructor */
	public Room(User user, Catalog catalog, String roomname,
			String descriptive, String img, Integer price, String equipmaent,
			String rules, String address, Integer phone, Set orders) {
		this.user = user;
		this.catalog = catalog;
		this.roomname = roomname;
		this.descriptive = descriptive;
		this.img = img;
		this.price = price;
		this.equipmaent = equipmaent;
		this.rules = rules;
		this.address = address;
		this.phone = phone;
		this.orders = orders;
	}

	// Property accessors

	public Integer getRoomid() {
		return this.roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Catalog getCatalog() {
		return this.catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public String getRoomname() {
		return this.roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getDescriptive() {
		return this.descriptive;
	}

	public void setDescriptive(String descriptive) {
		this.descriptive = descriptive;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getEquipmaent() {
		return this.equipmaent;
	}

	public void setEquipmaent(String equipmaent) {
		this.equipmaent = equipmaent;
	}

	public String getRules() {
		return this.rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPhone() {
		return this.phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}