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
		String address = (String) request.getAttribute("address");
		String temp = (String) session.getAttribute("temp");
		String user = request.getParameter("user");
		String pass = request.getParameter("pwd");
	%>
	<center>
		<table style="width: 200px;border: 1px solid black;">
			<caption>
				<%=temp%></caption>
			<tr>
				<td style="width;50%;">Username:</td>
				<td style="width;50%;"><%=user%></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><%=pass%></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><%=address%></td>
			</tr>
		</table>
	</center>
</body>
</html>