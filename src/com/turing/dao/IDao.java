package com.turing.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IDao {
	
	List<Map<String,Object>> executeQueryForList(String sql) throws ClassNotFoundException, SQLException;
	List<Map<String,Object>> executeQueryForList(String sql,int[] types,Object[] values) throws ClassNotFoundException, SQLException;
	Map<String,Object> executeQueryForMap(String sql) throws ClassNotFoundException, SQLException;
	Map<String,Object> executeQueryForMap(String sql,int[] types,Object[] values) throws ClassNotFoundException, SQLException;
	int executeUpdate(String sql) throws ClassNotFoundException, SQLException;
	int executeUpdate(String sql,int[] types,Object[] values) throws ClassNotFoundException, SQLException;

}
