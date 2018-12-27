package com.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.*;

import com.dao.impl.IOrderDAO;
import com.vo.Order;
import com.vo.Room;
import com.vo.User;

public class OrderDAO extends BaseDAO implements IOrderDAO {

	private Order order;
	
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	

	public Boolean saveOrder(Order order){
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		System.out.print("savetrue1");
		session.save(order);
		tx.commit();
		session.close();
		System.out.print("savetrue");
		return true;
	}
	
	public List getOrderbyuserid(Integer userid,int currentPage,int pageSize){
		Session session = getSession();
		String hql="from Order o where o.user.userid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userid);
		int startRow=0;
		startRow=(currentPage-1)*pageSize; //起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List orders = query.list();
		return orders;
		
	}
	
	public int getTotalbyuserid(Integer userid) {
		Session session=getSession();
		Query query=session.createQuery("from Order o where o.user.userid=? Order by orderid desc");
		query.setParameter(0,userid);
		List orders=query.list();
		int totalSize=orders.size();
		session.close();
		return totalSize;
	}
	
	public List getMyOrderbysellerid(Integer userid,int currentPage,int pageSize){
		Session session = getSession(); 
		String hql="from Order o where o.sellerid=? Order by orderid desc";
		Query query = session.createQuery(hql);
		query.setParameter(0, userid);
		int startRow=0;
		startRow=(currentPage-1)*pageSize; //起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List Sellerorders = query.list();
		return Sellerorders;
	}
	
	public boolean updatestatus(int orderstatus, Integer orderid) {
		String sql = "update Order o set o.orderstatus=? where o.orderid=?";
		Session session = getSession();
		Query query = session.createQuery(sql);
		query.setParameter(0, orderstatus);
		query.setParameter(1, orderid);
		query.executeUpdate();
		return true;
	}
	
	public boolean updatereason(String reason, Integer orderid) {
		String sql = "update Order o set o.orderstatus=? where o.reason=?";
		Session session = getSession();
		Query query = session.createQuery(sql);
		query.setParameter(0, reason);
		query.setParameter(1, orderid);
		query.executeUpdate();
		return true;
	}
	

}
