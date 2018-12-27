package com.dao.impl;

import java.util.Date;
import java.util.List;

import com.vo.Order;
import com.vo.Room;
import com.vo.User;

public interface IOrderDAO {
	public Boolean saveOrder(Order order);
	public List getOrderbyuserid(Integer userid,int currentPage,int pageSize);
	public int getTotalbyuserid(Integer userid);
	public List getMyOrderbysellerid(Integer userid,int currentPage,int pageSize);
	public boolean updatestatus(int orderstatus, Integer orderid);
	public boolean updatereason(String reason, Integer orderid) ;
}
