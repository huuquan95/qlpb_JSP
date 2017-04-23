<%@page import="ClassUtilities.MySQLQueryUtilities"%>
<%@page import="ClassUtilities.MySQLConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ClassUtilities.SQLConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="div_center_mid">
	<%
		try {
			String maPhongBan = request.getParameter("MaPhongBan");
			ResultSet rs = MySQLQueryUtilities.getPhongBanCuThe(maPhongBan);
			String tenPhongBan = MySQLQueryUtilities.getTenPhongBan(maPhongBan);
	%>
	<table class="table table-resposive table-hover">
		<caption>
			<h3>
				Danh sách nhân viên trong phòng <b><%=tenPhongBan%></b>
			</h3>
		</caption>
		<tr>
			<th>Mã nhân viên</th>
			<th>Tên nhân viên</th>
			<th>Địa chỉ</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("MaNhanVien")%></td>
			<td><%=rs.getString("TenNhanVien")%></td>
			<td><%=rs.getString("DiaChi")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} catch (Exception e) {
	%>
	<h3>Dữ liệu không tồn tại!</h3>
	<%
		}
	%>
</div>