package com.turing.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DaoImpl implements IDao{

	private static final String DRIVER_STR = Messages.getString("jdbc.driverClassName"); //$NON-NLS-1$
	private static final String URL = Messages.getString("jdbc.url"); //$NON-NLS-1$
	private static final String USERNAME = Messages.getString("jdbc.username"); //$NON-NLS-1$
	private static final String PASSWORD = Messages.getString("jdbc.password"); //$NON-NLS-1$

	@Override
	public List<Map<String, Object>> executeQueryForList(String sql) throws ClassNotFoundException, SQLException {
		loadDriver();
		Connection conn = getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<Map<String, Object>> list = rs2ListMap(rs);
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}

	@Override
	public List<Map<String, Object>> executeQueryForList(String sql, int[] types, Object[] values) throws ClassNotFoundException, SQLException {
		loadDriver();
		Connection conn = getConnection();
		PreparedStatement stmt = preSetParams(sql, types, values, conn);
		ResultSet rs = stmt.executeQuery();
		List<Map<String, Object>> list = rs2ListMap(rs);
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}

	@Override
	public Map<String, Object> executeQueryForMap(String sql) throws ClassNotFoundException, SQLException {
		List<Map<String, Object>> list = executeQueryForList(sql);
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	@Override
	public Map<String, Object> executeQueryForMap(String sql, int[] types, Object[] values) throws ClassNotFoundException, SQLException {
		List<Map<String, Object>> list = executeQueryForList(sql, types, values);
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	@Override
	public int executeUpdate(String sql) throws ClassNotFoundException, SQLException {
		loadDriver();
		Connection conn = getConnection();
		Statement stmt = conn.createStatement();
		int count = stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		return count;
	}

	@Override
	public int executeUpdate(String sql, int[] types, Object[] values) throws ClassNotFoundException, SQLException {
		loadDriver();
		Connection conn = getConnection();
		PreparedStatement stmt = preSetParams(sql, types, values, conn);
		int count = stmt.executeUpdate();
		stmt.close();
		conn.close();
		return count;
	}

	private void loadDriver() throws ClassNotFoundException {
		Class.forName(DRIVER_STR);
	}

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL,USERNAME,PASSWORD);
	}

	private PreparedStatement preSetParams(String sql, int[] types,
			Object[] values, Connection conn) throws SQLException {
		PreparedStatement stmt = conn.prepareStatement(sql);
		for(int i=0;i<types.length;i++){
			switch (types[i]) {
			case Types.VARCHAR:
				stmt.setString(i+1, values[i].toString());
				break;
			case Types.INTEGER:
				stmt.setInt(i+1, Integer.parseInt(values[i].toString()));
				break;
			default:
				stmt.setString(i+1, values[i].toString());
				break;
			}
		}
		return stmt;
	}

	private List<Map<String, Object>> rs2ListMap(ResultSet rs) throws SQLException {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		ResultSetMetaData rsmd = rs.getMetaData();
		while (rs.next()) {
			Map<String,Object> map = new HashMap<String,Object>();
			
			for(int i=1;i<=rsmd.getColumnCount();i++){
				String zdm = rsmd.getColumnName(i);
				String zdz = rs.getString(i);
				map.put(zdm, zdz);
			}
			
			list.add(map);
		}
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		IDao dao = new DaoImpl();
		List<Map<String, Object>> list = dao.executeQueryForList("select * from news");
		System.out.println(list);
	}

}
