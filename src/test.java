
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;

import com.dao.BaseDAO;


public class test extends BaseDAO {
	@Test
	public void checkout() throws Exception{
		Session session=getSession();
		Query query=session.createQuery("from Room r where r.roomname like '% so%'");
		List rooms=query.list();
		session.close();
		System.out.println(rooms.size());
	}
}
