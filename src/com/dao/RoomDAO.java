package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.impl.IRoomDAO;
import com.vo.Room;
import com.vo.User;

public class RoomDAO extends BaseDAO implements IRoomDAO {

	// ��ʾ����ͼ�飬��û�з�ҳ
	public List getallroom() {
		Session session = getSession();
		String hql = "from Room r";
		Query query = session.createQuery(hql);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// ��ҳ��ʾ����ͼ�飬��Ҫ��һ����ǰҳ����һ��ÿҳ��¼��
	public List getallroomPaging(int currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Room r";
		Query query = session.createQuery(hql);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // ��ʼ�α�λ��
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// ���ݷ����ҳ��ʾ������
	public List getallroomPagingbycatalog(int catalogid, int currentPage,
			int pageSize) {
		Session session = getSession();
		String hql = "from Room r where r.catalog.catalogid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, catalogid);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // ��ʼ�α�λ��
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// �����̼ҷ�ҳ��ʾ������
	public List getallroomPagingbySeller(int Sellerid, int currentPage,
			int pageSize) {
		Session session = getSession();
		String hql = "from Room r where r.user.userid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, Sellerid);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // ��ʼ�α�λ��
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		session.close();
		return rooms;
	}

	// ���ȫ����totalSize���ܼ�¼����
	public int getAllTotal() {
		Session session = getSession();
		Query query = session.createQuery("from Room r");
		List books = query.list();
		int totalSize = books.size();
		System.out.println("totalSize" + totalSize);
		session.close();
		return totalSize;
	}

	// ��ø÷����totalSize���ܼ�¼����
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

	// ��ø��̼ҵ�totalSize���ܼ�¼����
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
	// �������ͼ���totalSize���ܼ�¼����
	public int getTotalbyRequiredroom(String hql) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		List books = query.list();
		int totalSize = books.size();
		session.close();
		return totalSize;
	}

	// ͨ��id���Room
	public Room getRoombyId(Integer roomid) {
		Session session = getSession();
		// Hibernate����Book��ĳ־ö���
		Room room = (Room) session.get(Room.class, roomid);
		session.close();
		return room;
	}

	// ����hql�����������ҳ��ʾ
	public List getRequiredBookbyHqlPaging(String hql, int currentPage,
			int pageSize) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		int startRow = 0;
		startRow = (currentPage - 1) * pageSize; // ��ʼ�α�λ��
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List rooms = query.list();
		System.out.println("rooms.size()" + rooms.size());
		session.close();
		return rooms;
	}

	// ���ݷ����ҳ��ʾ������
	/*
	 * public List getroombyCatalogidPaging(Integer catalogid, int currentPage,
	 * int pageSize) { Session session=getSession(); Query query =
	 * session.createQuery("from Room r where r.catalog.catalogid=?");
	 * query.setParameter(0, catalogid); int startRow=0;
	 * startRow=(currentPage-1)*pageSize; //��ʼ�α�λ��
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
