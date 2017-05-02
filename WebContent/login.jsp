<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String temp = "Welcome to QuanDinh";
		session.setAttribute("temp", temp);
	%>
	<center>
		<form action="checkLogin.jsp" method="post">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="user"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="pwd"></td>
				</tr>
			</table>
			<input type="submit" name="btn_Submit" value="Login"> <input
				type="reset" name="btn_Reset" value="Reset"> <input
				type="button" name="btn_Exit" value="Exit">
		</form>
	</center>
</body>
</html>