<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.groupad.jsp.*"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<%
	String sessionLogin = (String) request.getSession().getAttribute("sessionLogin");

	if (null != session.getAttribute("sessionLogin")) {
		
		ResultSet resultSet = null;

		resultSet = database.query("SELECT * FROM users WHERE idusers = '" + sessionLogin + "'");

		String username = null;
		while (resultSet.next()) {

			username = resultSet.getString("username");
			
		}

		out.print("Welcome to Milestone Planner " + username);

	} else {
		String redirectURL = "http://localhost:8080/milestonePlanner/";
		response.sendRedirect(redirectURL);
	}
%>

<a href="http://localhost:8080/milestonePlanner/logout.jsp">Logout</a>
</body>
</html>