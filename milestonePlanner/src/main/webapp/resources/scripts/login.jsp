
<%@ page import="com.groupad.jsp.*"%>
<%@page import="java.sql.ResultSet"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	ResultSet resultSet = null;

	resultSet = database.query("SELECT * FROM users WHERE username = '" + username + "'");

	while (resultSet.next()) {

		String passwordHash = resultSet.getString("password");
		String userID = resultSet.getString("idusers");

		if (passwordHash.equals(password)) {
			
			HttpSession sessioni = request.getSession();
			sessioni.setAttribute("sessionLogin", userID);
			
			
		} else {
			out.print("Wrong Username or Password!");
		}

	}
%>