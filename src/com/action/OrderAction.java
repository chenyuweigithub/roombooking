package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.impl.IOrderService;
import com.service.impl.IRoomService;
import com.util.Pager;
import com.vo.Order;
import com.vo.Room;
import com.vo.User;;

public class OrderAction extends ActionSupport {
	private Order order;
	private Integer roomid;
	private IRoomService roomService;
	private IOrderService orderService;
	private Integer currentPage=1;
	private Integer orderstatus;
	private String reason; 
	private Integer orderid;

	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getRoomid() {
		return roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

	public IRoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(IRoomService roomService) {
		this.roomService = roomService;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String checkout() throws Exception{
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		if(user==null)
			return "usernull";
		Room room=roomService.getRoombyId(roomid);
		String usertime;
		order.setRoom(room);
		order.setUser(user);
		order.setSellerid(room.getUser().getUserid());
		order.setOrderdate(new Date());
		order.setOrderstatus(1);
		/*Order o = new Order(room,user,new Date(),"2018/11/26 9:04-10:04",1,5184158,"remarks");*/
		orderService.saveOrder(order);
		return SUCCESS;
	}
	
	public String getOrderbyuserid(){
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		if(user==null)
			return "usernull";
		int totalSize=orderService.getTotalbyuserid(user.getUserid()); //获得totalSize（总记录数）
		Pager pager=new Pager(currentPage,totalSize);
		List orders = orderService.getOrderbyuserid(user.getUserid(),currentPage,pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orders", orders);
		request.put("pager",pager);
		return SUCCESS;
	}
	
	public String getMyOrderbysellerid(){
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		if(user==null)
			return "usernull";
		int totalSize=orderService.getTotalbyuserid(user.getUserid()); //获得totalSize（总记录数）
		Pager pager=new Pager(currentPage,totalSize);
		List Sellerorders = orderService.getMyOrderbysellerid(user.getUserid(),currentPage,pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("Sellerorders", Sellerorders);
		request.put("pager",pager);
		return SUCCESS;
	}
	
	public String updatestatus(){
		boolean validated=false;
		validated = orderService.updatestatus(orderstatus, orderid);
		return SUCCESS;
	}
	
	public String updatereason(){
		boolean validated=false;
		validated = orderService.updatereason(reason, orderid);
		return SUCCESS;
	}
}
