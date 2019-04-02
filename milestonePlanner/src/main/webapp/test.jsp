<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%


	DB_Connection obj_DB_Connection=new DB_Connection();
	Connection connection=null;
	connection=obj_DB_Connection.get_connection();
	System.out.println(connection);
	
Class.forName("com.mysql.jdbc.Driver");
connection=DriverManager.getConnection("jdbc:mysql://hostname:3306/databasename","username","password");

