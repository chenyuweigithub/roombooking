package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.impl.IRoomDAO;
import com.vo.Room;
import com.vo.User;

public class RoomDAO extends BaseDAO implements IRoomDAO {

	// 显示所有图书，还没有分页
	public List getallroom() {
		Session session = getSession();
		String hql = "from Room r";
		Query query = session.createQuery(hql);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// 分页显示所有图书，需要传一个当前页数，一个每页记录数
	public List getallroomPaging(int currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Room r";
		Query query = session.createQuery(hql);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // 起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// 根据分类分页显示排练房
	public List getallroomPagingbycatalog(int catalogid, int currentPage,
			int pageSize) {
		Session session = getSession();
		String hql = "from Room r where r.catalog.catalogid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, catalogid);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // 起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// 根据商家分页显示排练房
	public List getallroomPagingbySeller(int Sellerid, int currentPage,
			int pageSize) {
		Session session = getSession();
		String hql = "from Room r where r.user.userid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, Sellerid);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // 起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// 获得全部的totalSize（总记录数）
	public int getAllTotal() {
		Session session = getSession();
		Query query = session.createQuery("from Room r");
		List books = query.list();
		int totalSize = books.size();
		System.out.println("totalSize" + totalSize);
		session.close();
		return totalSize;
	}

	// 获得该分类的totalSize（总记录数）
	@Override
	public int getTotalbySeller(Integer Seller) {
		Session session = getSession();
		Query query = session
				.createQuery("from Room r where r.catalog.catalogid=?");
		query.setParameter(0, Seller);
		List books = query.list();
		int totalSize = books.size();
		session.close();
		return totalSize;
	}

	// 获得该商家的totalSize（总记录数）
	@Override
	public int getTotalbyCatalog(Integer catalogid) {
		Session session = getSession();
		Query query = session
				.createQuery("from Room r where r.user.userid=?");
		query.setParameter(0, catalogid);
		List books = query.list();
		int totalSize = books.size();
		session.close();
		return totalSize;
	}
	// 获得搜索图书的totalSize（总记录数）
	public int getTotalbyRequiredroom(String hql) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		List books = query.list();
		int totalSize = books.size();
		session.close();
		return totalSize;
	}

	// 通过id获得Room
	public Room getRoombyId(Integer roomid) {
		Session session = getSession();
		// Hibernate返回Book类的持久对象
		Room room = (Room) session.get(Room.class, roomid);
		session.close();
		return room;
	}

	// 根据hql语句搜索，分页显示
	public List getRequiredBookbyHqlPaging(String hql, int currentPage,
			int pageSize) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // 起始游标位置
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		System.out.println("rooms.size()" + rooms.size());
		session.close();
		return rooms;
	}

	// 根据分类分页显示排练房
	/*
	 * public List getroombyCatalogidPaging(Integer catalogid, int currentPage,
	 * int pageSize) { Session session=getSession(); Query query =
	 * session.createQuery("from Room r where r.catalog.catalogid=?");
	 * query.setParameter(0, catalogid); int startRow=0;
	 * startRow=(currentPage-1)*pageSize; //起始游标位置
	 * query.setFirstResult(startRow); query.setMaxResults(pageSize); List
	 * books=query.list(); session.close(); return books; }
	 */
	public boolean saveRoom(Room room) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.save(room);
		tx.commit();
		session.close();
		return true;
	}
	
	public boolean deleteRoombyid(int roomid) {
		String sql="delete Room r where r.roomid=?";
		Session session=getSession();
		Query query=session.createQuery(sql);
		query.setParameter(0,roomid);
		query.executeUpdate();
		return true;
	}

}
