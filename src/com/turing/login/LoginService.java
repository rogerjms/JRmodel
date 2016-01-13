package com.turing.login;

import java.sql.SQLException;
import java.util.Map;

import com.turing.dao.DaoImpl;
import com.turing.dao.IDao;

public class LoginService {
	
	private IDao dao = new DaoImpl();

	public Map<String, Object> queryUserByNameAndPass(String username, String password) throws ClassNotFoundException, SQLException {
		String sql = "select * from user where username = ? and password = ? ";
		int[] types = {12,12};
		Object[] values = {username,password};
		return dao.executeQueryForMap(sql, types, values);
	}

}
