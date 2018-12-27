package com.service;

import java.util.List;

import com.dao.impl.IRoomDAO;
import com.service.impl.IRoomService;
import com.vo.Room;

public class RoomService implements IRoomService {
	private IRoomDAO roomDAO;
	
	public IRoomDAO getRoomDAO() {
		return roomDAO;
	}

	public void setRoomDAO(IRoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}

	public List getallroom() {
		return roomDAO.getallroom();
	}
	public List getallroomPaging(int currentPage,int pageSize) {
		return roomDAO.getallroomPaging(currentPage,pageSize);
	}
	public int getAllTotal(){
		return roomDAO.getAllTotal();
	}
	public int getTotalbyRequiredroom(String hql){
		return roomDAO.getTotalbyRequiredroom(hql);
	}

	public List getallroomPagingbycatalog(int catalogid, int currentPage,
			int pageSize) {
		return roomDAO.getallroomPagingbycatalog(catalogid, currentPage, pageSize);
	}

	public int getTotalbyCatalog(Integer catalogid) {
		// TODO Auto-generated method stub
		return roomDAO.getTotalbyCatalog(catalogid);
	}
	
	public Room getRoombyId(Integer roomid){
		return roomDAO.getRoombyId(roomid);
	}
	
	public List getRequiredBookbyHqlPaging(String hql, int currentPage,
			int pageSize) {
		return roomDAO.getRequiredBookbyHqlPaging(hql, currentPage, pageSize);
	}
	
	public boolean saveRoom(Room room){
		return roomDAO.saveRoom(room);
	}
	public List getallroomPagingbySeller(int Sellerid, int currentPage,
			int pageSize){
		return roomDAO.getallroomPagingbySeller(Sellerid, currentPage, pageSize);
	}
	
	public int getTotalbySeller(Integer Sellerid){
		return roomDAO.getTotalbySeller(Sellerid);
	}
	
	public boolean deleteRoombyid(int roomid){
		return roomDAO.deleteRoombyid(roomid);
	}
}
