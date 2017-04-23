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

		$('#table_PhongBan tr td a').click(function() {
			$("#noidung").load(this.id);
		});
	});
</script>

<div class="div_center_mid">
	<%
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
			<th>Thời gian</th>
			<th>Xem nhân viên</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><a id="XemPhongBanCuThe.jsp?MaPhongBan=<%=rs.getString(1)%>" href="#">Xem</a></td>
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