package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dao.impl.ICatalogDAO;

public class CatalogDAO extends BaseDAO implements ICatalogDAO {
	public List getAllCatalogs() {
		// TODO Auto-generated method stub
		Session session = getSession();
		Query query = session.createQuery("from Catalog c");
		List catalogs = query.list();
		session.close();
		return catalogs;
	}
}
