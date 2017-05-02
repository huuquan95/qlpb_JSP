<%@page import="java.sql.ResultSet"%>
<%@page import="ClassUtilities.SQLConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Chào Quân Đinh</h1>
	<table style="border: 1px solid black;">
		<caption>Danh sách sinh viên</caption>
		<th>Mssv</th><th>Tên sinh viên</th>
		<%
			try {
				Connection con = SQLConnection.getSQLServerConnection();
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery("SELECT* FROM NHANVIEN");
				while (rs.next()) {
		%>
		<tr>
			<td style="with:100px;"><%=rs.getString(1)%></td>
			<td style="with:200px;"><%=rs.getString(2)%></td>
		</tr>
		<%
			}
			} catch (Exception e) {

			}
		%>
	</table>
</body>
</html>