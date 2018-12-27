package com.service;

import java.util.Date;
import java.util.List;

import com.dao.OrderDAO;
import com.dao.impl.IOrderDAO;
import com.service.impl.IOrderService;
import com.vo.Order;
import com.vo.Room;
import com.vo.User;

public class OrderService implements IOrderService {
	private  IOrderDAO  orderDAO ;
	

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}
	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public Boolean saveOrder(Order order){
		return orderDAO.saveOrder(order);
	}
	
	public List getOrderbyuserid(Integer userid,int currentPage,int pageSize){
		return orderDAO.getOrderbyuserid(userid, currentPage, pageSize);
	}
	public int getTotalbyuserid(Integer userid){
		return orderDAO.getTotalbyuserid(userid);
	}
	public List getMyOrderbysellerid(Integer userid,int currentPage,int pageSize){
		return orderDAO.getMyOrderbysellerid(userid, currentPage, pageSize);
	}
	public boolean updatestatus(int orderstatus, Integer orderid){
		return orderDAO.updatestatus(orderstatus, orderid);
	}
	public boolean updatereason(String reason, Integer orderid) {
		return orderDAO.updatereason(reason, orderid);
	}

}
