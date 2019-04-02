<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.groupad.jsp.*"%>
<%@page import="java.sql.ResultSet"%>

<%

	if (null != session.getAttribute("sessionLogin")) {

		String redirectURL = "http://localhost:8080/milestonePlanner/home";
		response.sendRedirect(redirectURL);

	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
<div class="result" id="result"></div>
	<div class="login-page">
		<div class="form">
			<form class="register-form">
				<h3>Register</h3>
				<input type="text" placeholder="name" /> <input type="password"
					placeholder="password" /> <input type="text"
					placeholder="email address" />
				<button>create</button>
				<p class="message">
					Already registered? <a href="#">Sign In</a>
				</p>
			</form>
			<form class="login-form" id="login-form">
				<h3>Login</h3>
				<input type="text" placeholder="username" name="username" /> <input type="password"
					placeholder="password" name="password" />
				<button>login</button>
				<p class="message">
					Not registered? <a href="#">Create an account</a>
				</p>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$("#login-form").submit(function(e) {
			e.preventDefault()
			$.ajax({
				type : "post",
				url : "resources/scripts/login.jsp",
				data:  $('#login-form').serialize(),
				//dataType: "json",
				success : function(data) {
					console.log(data);
					location.href = "/milestonePlanner/home"
				},
				error: function (jqXHR, exception) {
				    console.log("Error " + jqXHR.responseText);
				}
			});
		});
	</script>
</body>
</html>