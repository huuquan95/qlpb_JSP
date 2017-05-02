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
	<%
		String user = request.getParameter("user");
		String pass = request.getParameter("pwd");
		String address = "Quang Nam";

		try {
			Connection con = SQLConnection.getSQLServerConnection();
			Statement stm = con.createStatement();

			ResultSet rs = stm
					.executeQuery("select * from SINHVIEN where MaSV='" + user + "' and Pass='" + pass + "'");

			if (rs.next()) {

				request.setAttribute("address", rs.getString("DiaChi"));
				RequestDispatcher dispacher = request.getRequestDispatcher("welcome.jsp");
				dispacher.forward(request, response);
			} else {

				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
		}
	%>
</body>
</html>