package com.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Catalog entity. @author MyEclipse Persistence Tools
 */

public class Catalog implements java.io.Serializable {

	// Fields

	private Integer catalogid;
	private String catalogname;
	private Set rooms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Catalog() {
	}

	/** minimal constructor */
	public Catalog(Integer catalogid, String catalogname) {
		this.catalogid = catalogid;
		this.catalogname = catalogname;
	}

	/** full constructor */
	public Catalog(Integer catalogid, String catalogname, Set rooms) {
		this.catalogid = catalogid;
		this.catalogname = catalogname;
		this.rooms = rooms;
	}

	// Property accessors

	public Integer getCatalogid() {
		return this.catalogid;
	}

	public void setCatalogid(Integer catalogid) {
		this.catalogid = catalogid;
	}

	public String getCatalogname() {
		return this.catalogname;
	}

	public void setCatalogname(String catalogname) {
		this.catalogname = catalogname;
	}

	public Set getRooms() {
		return this.rooms;
	}

	public void setRooms(Set rooms) {
		this.rooms = rooms;
	}

}