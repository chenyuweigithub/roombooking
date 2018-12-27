package com.vo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Room room;
	private User user;
	private Integer sellerid;
	private Date orderdate;
	private String usedate;
	private Integer orderstatus;
	private Integer phone;
	private String remarks;
	private String reason;
	private Set comments = new HashSet(0);

	// Constructors

	public Order(Room room, User user, Date orderdate,
			String usedate, Integer orderstatus, Integer phone,String remarks) {
		this.room = room;
		this.user = user;
		this.orderdate = orderdate;
		this.usedate = usedate;
		this.orderstatus = orderstatus;
		this.phone = phone;
		this.remarks = remarks;
	}
	
	public Order(Integer orderid,Room room, User user, Date orderdate,
			String usedate, Integer orderstatus, Integer phone,String remarks) {
		this.orderid = orderid;
		this.room = room;
		this.user = user;
		this.orderdate = orderdate;
		this.usedate = usedate;
		this.orderstatus = orderstatus;
		this.phone = phone;
		this.remarks = remarks;
	}

	
	/** default constructor */
	public Order() {
	}

	/** full constructor */
	public Order(Room room, User user, Date orderdate, String usedate,
			Integer orderstatus, Integer phone, String remarks, String reason,
			Set comments) {
		this.room = room;
		this.user = user;
		this.orderdate = orderdate;
		this.usedate = usedate;
		this.orderstatus = orderstatus;
		this.phone = phone;
		this.remarks = remarks;
		this.reason = reason;
		this.comments = comments;
	}

	// Property accessors

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public Integer getSellerid() {
		return sellerid;
	}

	public void setSellerid(Integer sellerid) {
		this.sellerid = sellerid;
	}
	public Date getOrderdate() {
		return this.orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getUsedate() {
		return this.usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public Integer getOrderstatus() {
		return this.orderstatus;
	}

	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}

	public Integer getPhone() {
		return this.phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}