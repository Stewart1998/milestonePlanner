
<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%
response.setContentType("application/json");


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
%>
[ {"label":"error", "value":"false"}]
<%
	} else {
%>
[
   {"label":"error", "value":"true"},
   {"label":"msg", "value":"Username or Password incorrect!"}
]
<%
	}

	}
%>
