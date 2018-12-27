package com.util;

public class Pager {
	private int currentPage;   //��ǰҳ��
	private int PageSize=6;  //ÿҳ��¼��
	private int totalSize; //�ܼ�¼��
	private int totalPage; //��ҳ��
	
	private boolean hasFirst;
	private boolean hasPrevious;
	private boolean hasNext;
	private boolean hasLast;
	
	//���췽��
	public Pager (int currentPage,int totalSize){
		this.currentPage=currentPage;
		this.totalSize=totalSize;
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getPageSize() {
		return PageSize;
	}
	public void setPageSize(int pageSize) {
		PageSize = pageSize;
	}
	
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	
	//�����ҳ��
	public int getTotalPage() {
		totalPage = totalSize/PageSize;
		if(totalSize%PageSize!=0)
			totalPage++;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	//�Ƿ�����ҳ
	public boolean isHasFirst() {
		if(currentPage==1)
			return false;
		return true;
	}
	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}
	
	//�Ƿ�����һҳ
	public boolean isHasPrevious() {
		if(isHasFirst())
			return true;
		return false;
	}
	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}
	
	//�Ƿ�����һҳ
	public boolean isHasNext() {
		if(isHasLast())
			return true;
		return false;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	
	//�Ƿ���βҳ
	public boolean isHasLast() {
		if(currentPage==getTotalPage())
			return false;
		return true;
	}
	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}
	
	
	
	
}
