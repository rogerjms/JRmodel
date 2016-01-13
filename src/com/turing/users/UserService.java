package com.turing.users;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.turing.dao.DaoImpl;
import com.turing.dao.IDao;

public class UserService {
	
	private IDao dao = new DaoImpl();

	public void saveRegisterInfo(String username, String password, String email) throws ClassNotFoundException, SQLException {
		
		String sql = "INSERT INTO hypertension.user  "+
					" (username, password, email, regdate,sex,age) "+
					" VALUES (?,?,?,?,'',0) ";
		int[] types = {12,12,12,12};
		Object[] values = {username,password,email,new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())};
		dao.executeUpdate(sql, types, values);
		
	}

	public Map<String, Object> queryUserByAccountno(String accountno) throws ClassNotFoundException, SQLException {
		
		return dao.executeQueryForMap("select * from user where username = ? ", new int[]{12}, new Object[]{accountno});
	}
	
	

}
