package com.groupad.jsp;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public class database {

	public static Connection connect() {
		String driverName = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "main";
		String userId = "root";
		String password = "GlasgowCali2019";

		String result = null;
		
		Connection connection = null;

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);

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


