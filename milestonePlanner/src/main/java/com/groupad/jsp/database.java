package com.groupad.jsp;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public class database {

	public static Connection connect() {
		String url = "jdbc:mysql://mysql.stackcp.com:52430/";
		String dbName = "webplat2-39378a48";

		String userName = "webplat2-39378a48";
		String password = "GlasgowCali2019";
		
		String result;
		
		Connection connection = null;	
		

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			
			connection = DriverManager.getConnection(url + dbName, userName, password);

			if (!connection.isClosed()) {
				result =  "true";

			}else {
				result =  "false";
			}
		} catch (Exception ex) {

		}
		
		return connection;

	}
	
public static ResultSet query(String sql) {
	Statement statement = null;
	ResultSet resultSet = null;
	
	Connection Connection = connect();
	
	try {
	statement=Connection.createStatement();

	resultSet = statement.executeQuery(sql);
	
	} catch (Exception ex) {

	}
	
	return resultSet;
	
	}
	
}


