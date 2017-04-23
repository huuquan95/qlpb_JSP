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
<script type="text/javascript">
	$(document).ready(function() {

		$('table tr td a').click(function() {
			$("#noidung").load(this.id);
		});
	});
</script>
<div class="div_center_mid">
	<h2>Cập Nhật Thông Tin</h2>
	<%
		try {
			ArrayList<NhanVien> list = MySQLQueryUtilities.getAllNhanVien();
	%>
	<table class="table table-resposive table-hover">
		<caption>
			<h3>Danh sách nhân viên</h3>
		</caption>
		<tr>
			<th>Mã nhân viên</th>
			<th>Tên nhân viên</th>
			<th>Chỉnh sửa</th>
		</tr>
		<%
			for (NhanVien nhanVien : list) {
		%>
		<tr>
			<td><%=nhanVien.getMaNhanVien()%></td>
			<td><%=nhanVien.getTenNhanVien()%></td>
			<td><a
				id="SuaNhanVien.jsp?MaNhanVien=<%=nhanVien.getMaNhanVien()%>">Sửa</a></td>
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

		try {
			ResultSet rs = MySQLQueryUtilities.getAllPhongBan();
	%>
	<table class="table table-resposive table-hover" id="table_PhongBan">
		<caption>
			<h3>Danh sách phòng ban</h3>
		</caption>
		<tr>
			<th>Mã phòng ban</th>
			<th>Tên phòng ban</th>
			<th>Chỉnh sửa</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("MaPhongBan")%></td>
			<td><%=rs.getString("TenPhongBan")%></td>
			<td><a
				id="SuaPhongBan.jsp?MaPhongBan=<%=rs.getString("MaPhongBan")%>">Sửa</a></td>
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