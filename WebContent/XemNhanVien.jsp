<%@page import="DataTransferObject.NhanVien"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<NhanVien> list = MySQLQueryUtilities.getAllNhanVien();
		if (list.size() != 0) {
	%>
	<table class="table table-resposive table-hover">
		<caption>
			<h3>Danh sách nhân viên</h3>
		</caption>
		<tr>
			<th>Mã nhân viên</th>
			<th>Tên nhân viên</th>
			<th>Phòng ban</th>
			<th>Địa chỉ</th>
		</tr>
		<%
			for (NhanVien nhanVien : list) {
		%>
		<tr>
			<td><%=nhanVien.getMaNhanVien()%></td>
			<td><%=nhanVien.getTenNhanVien()%></td>
			<td><%=nhanVien.getTenPhongBan()%></td>
			<td><%=nhanVien.getDiaChi()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<h3>Dữ liệu không tồn tại!</h3>
	<%
		}
	%>
</div>