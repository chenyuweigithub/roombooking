package com.service;

import java.util.List;

import com.dao.impl.ICatalogDAO;
import com.service.impl.ICatalogService;


public class CatalogService implements ICatalogService {
	private ICatalogDAO catalogDAO;
	
	@Override
	public List getAllCatalogs() {
		// TODO Auto-generated method stub
		return catalogDAO.getAllCatalogs();
	}
	
	
	public ICatalogDAO getCatalogDAO() {
		return catalogDAO;
	}
	public void setCatalogDAO(ICatalogDAO catalogDAO) {
		this.catalogDAO = catalogDAO;
	}
}
