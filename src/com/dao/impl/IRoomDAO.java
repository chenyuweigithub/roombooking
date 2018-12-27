package com.dao.impl;

import java.util.List;

import com.vo.Room;

public interface IRoomDAO {
	public List getallroom();
	public List getallroomPaging( int currentPage,int pageSize);
	public int getAllTotal();
	public List getallroomPagingbycatalog(int catalogid,int currentPage,int pageSize);
	public int getTotalbyCatalog(Integer catalogid);
	public Room getRoombyId(Integer roomid);
	public List getRequiredBookbyHqlPaging(String hql, int currentPage,
			int pageSize);
	public int getTotalbyRequiredroom(String hql);
	public boolean saveRoom(Room room);
	public List getallroomPagingbySeller(int Sellerid, int currentPage,
			int pageSize);
	public int getTotalbySeller(Integer Seller);
	public boolean deleteRoombyid(int roomid);
}
