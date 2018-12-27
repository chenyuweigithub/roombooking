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
	//struts2在文件上传时提供的属性
	private String photoFileName;//上传的文件名。上传字段名称+FileName  注意大小写
	private String photoContentType;//上传文件的MIME类型。上传字段名称+ContentType 注意大小写
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

	//分类列表
	public String browseCatalog() {
		List catalogs = catalogService.getAllCatalogs();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("catalogs", catalogs);
		return SUCCESS;
	}
	
	//显示全部房间
	public String browseAllroom() {
		System.out.println("browseAllroom");
		List rooms = roomService.getallroom();
		Map request=(Map)ActionContext.getContext().get("request");
		
		request.put("rooms", rooms);
		return SUCCESS;
	}
	
	//分页显示全部排练房
	public String browseAllroomPaging() throws Exception{
		int totalSize=roomService.getAllTotal(); //获得totalSize（总记录数）
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
	
	
	//根据分类分页显示排练房
	public String getallroomPagingbycatalog() throws Exception{
		int totalSize=roomService.getTotalbyCatalog(catalogid); //获得totalSize（总记录数）
		Pager pager=new Pager(currentPage,totalSize);
		List rooms=roomService.getallroomPagingbycatalog(catalogid,currentPage, pager.getPageSize());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("rooms", rooms);
		request.put("pager",pager);
		Map session=ActionContext.getContext().getSession();
		request.put("catalogid",catalogid);
		return SUCCESS;
	}
	
	//根据商家显示排练房
		public String getallroomPagingbySeller() throws Exception{
			Map session=ActionContext.getContext().getSession();
			User user=(User)session.get("user");
			int totalSize=roomService.getTotalbySeller(user.getUserid()); //获得totalSize（总记录数）
			System.out.println("totalSizebySeller"+totalSize);
			Pager pager=new Pager(currentPage,totalSize);
			List rooms=roomService.getallroomPagingbySeller(user.getUserid(),currentPage, pager.getPageSize());
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("rooms", rooms);
			request.put("pager",pager);
			request.put("catalogid",catalogid);
			return SUCCESS;
		}
	
	//根据排练房id获取room
	public String getRoombyid(){
		Room room = roomService.getRoombyId(roomid);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("room",room);
		return SUCCESS;
	}
	
	//根据搜索分类显示排练房
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
		//1.拿到ServletContext
		ServletContext application = ServletActionContext.getServletContext();
		//2.调用realPath方法，获取根据一个虚拟目录得到的真实目录
		String filePath = application.getRealPath("/images/product");
		//3.如果这个真实的目录不存在，需要创建
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		//4.把photo存过去
		//拷贝：把photo的临时文件复制到指定的位置。注意：临时文件还在
		//FileUtils.copyFile(photo, new File(file,photoFileName));
		Date currentTime = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
		String s8 = formatter.format(currentTime); 
		System.out.println(s8);//得到字符串时间 
		name++;
		//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
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
