package com.action;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
















import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.dao.impl.IRoomDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RoomService;
import com.service.impl.ICatalogService;
import com.service.impl.IRoomService;
import com.util.Pager;
import com.vo.Catalog;
import com.vo.Room;
import com.vo.User;

public class RoomAction extends ActionSupport {
	private ICatalogService catalogService;
	private IRoomService roomService;
	private Integer catalogid;
	private Integer currentPage=1;
	private Integer roomid;
	private String roomname;
	private Room room;
	private File photo;
	//struts2���ļ��ϴ�ʱ�ṩ������
	private String photoFileName;//�ϴ����ļ������ϴ��ֶ�����+FileName  ע���Сд
	private String photoContentType;//�ϴ��ļ���MIME���͡��ϴ��ֶ�����+ContentType ע���Сд
    private int name=0;
    

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public Integer getRoomid() {
		return roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

	public Integer getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(Integer catalogid) {
		this.catalogid = catalogid;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public IRoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(IRoomService roomService) {
		this.roomService = roomService;
	}

	public ICatalogService getCatalogService() {
		return catalogService;
	}

	public void setCatalogService(ICatalogService catalogService) {
		this.catalogService = catalogService;
	}

	//�����б�
	public String browseCatalog() {
		List catalogs = catalogService.getAllCatalogs();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("catalogs", catalogs);
		return SUCCESS;
	}
	
	//��ʾȫ������
	public String browseAllroom() {
		System.out.println("browseAllroom");
		List rooms = roomService.getallroom();
		Map request=(Map)ActionContext.getContext().get("request");
		
		request.put("rooms", rooms);
		return SUCCESS;
	}
	
	//��ҳ��ʾȫ��������
	public String browseAllroomPaging() throws Exception{
		int totalSize=roomService.getAllTotal(); //���totalSize���ܼ�¼����
		Pager pager=new Pager(currentPage,totalSize);
		List rooms=roomService.getallroomPaging(currentPage, pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		System.out.println("browseAllroomPaging");
		request.put("rooms", rooms);
		request.put("pager",pager);
		Map session=ActionContext.getContext().getSession();
		request.put("catalogid",catalogid);
		return SUCCESS;
	}
	
	
	//���ݷ����ҳ��ʾ������
	public String getallroomPagingbycatalog() throws Exception{
		int totalSize=roomService.getTotalbyCatalog(catalogid); //���totalSize���ܼ�¼����
		Pager pager=new Pager(currentPage,totalSize);
		List rooms=roomService.getallroomPagingbycatalog(catalogid,currentPage, pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("rooms", rooms);
		request.put("pager",pager);
		Map session=ActionContext.getContext().getSession();
		request.put("catalogid",catalogid);
		return SUCCESS;
	}
	
	//�����̼���ʾ������
		public String getallroomPagingbySeller() throws Exception{
			Map session=ActionContext.getContext().getSession();
			User user=(User)session.get("user");
			int totalSize=roomService.getTotalbySeller(user.getUserid()); //���totalSize���ܼ�¼����
			System.out.println("totalSizebySeller"+totalSize);
			Pager pager=new Pager(currentPage,totalSize);
			List rooms=roomService.getallroomPagingbySeller(user.getUserid(),currentPage, pager.getPageSize());
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("rooms", rooms);
			request.put("pager",pager);
			request.put("catalogid",catalogid);
			return SUCCESS;
		}
	
	//����������id��ȡroom
	public String getRoombyid(){
		Room room = roomService.getRoombyId(roomid);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("room",room);
		return SUCCESS;
	}
	
	//��������������ʾ������
	public String getRequiredBookbyHqlPaging(){
		//StringBuffer hql=new StringBuffer("from Room r ");
		String hql = null;
		if(roomname!=null&&roomname.length()!=0){
			//hql.append("where r.roomname like '%"+roomname+"%'");
		hql="from Room r where r.roomname like '%"+roomname+"%'";
		int totalSize = roomService.getTotalbyRequiredroom(hql);
		Pager pager=new Pager(currentPage,totalSize);
		List rooms=roomService.getRequiredBookbyHqlPaging(hql, currentPage, pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("rooms",rooms);
		request.put("pager",pager);
		return SUCCESS;		
		}
		else{
			return ERROR;
		}
	}
	
	public String deleteRoombyid(){
		roomService.deleteRoombyid(roomid);
		return SUCCESS;	
	}
	
	public String upload(){
		//1.�õ�ServletContext
		ServletContext application = ServletActionContext.getServletContext();
		//2.����realPath��������ȡ����һ������Ŀ¼�õ�����ʵĿ¼
		String filePath = application.getRealPath("/images/product");
		//3.��������ʵ��Ŀ¼�����ڣ���Ҫ����
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		//4.��photo���ȥ
		//��������photo����ʱ�ļ����Ƶ�ָ����λ�á�ע�⣺��ʱ�ļ�����
		//FileUtils.copyFile(photo, new File(file,photoFileName));
		Date currentTime = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
		String s8 = formatter.format(currentTime); 
		System.out.println(s8);//�õ��ַ���ʱ�� 
		name++;
		//���У�����ʱ�ļ�����ָ����λ�ã����Ҹ����������� ע�⣺��ʱ�ļ�û����
		room.setImg(s8+name+photoFileName);
		photo.renameTo(new File(file,s8+name+photoFileName));
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
//		if(user==null)
//			return "usernull";
		room.setUser(user);
		System.out.println(room);
		roomService.saveRoom(room);
		return SUCCESS;
	}

	

}
