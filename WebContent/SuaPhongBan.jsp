<%@page import="DataTransferObject.PhongBan"%>
<%@page import="ClassUtilities.MySQLQueryUtilities"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="div_center_mid">
	<h2>Cập nhật thông tin phòng ban</h2>
	<%
		String maPhongBan = request.getParameter("MaPhongBan");
		PhongBan phongBan = MySQLQueryUtilities.getPhongBan(maPhongBan);
		if (phongBan.getMaPhongBan() != "") {
	%>
	<form class="form-horizontal" style="margin-top: 50px;">
		<div class="form-group">
			<label class="col-sm-3 control-label">Mã phòng ban</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="MaPhongBan"
					value="<%=phongBan.getMaPhongBan()%>" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Tên phòng ban</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="TenPhongBan"
					value="<%=phongBan.getTenPhongBan()%>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Thời gian</label>
			<div class="col-sm-8">
				<input class="form-control" type="date" id="ThoiGian"
					value="<%=phongBan.getThoigian()%>">
			</div>
		</div>
		<div style="text-align: center;">
			<input class="btn" type="button" value="Cập nhật" name="btn_Submit">
		</div>
	</form>
	<label id="notice" class="text-success" style="font-size: 18px;"></label>
	<%
		} else {
	%>
	<h3>Dữ liệu không tồn tại!</h3>
	<%
		}
	%>
</div>

<script type="text/javascript">
	function save() {

		var http = new XMLHttpRequest();
		http.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				$("#notice").text(this.responseText);
			}
		}

		link = "XuLySuaPhongBan.jsp?MaPhongBan="
				+ document.getElementById("MaPhongBan").value + "&TenPhongBan="
				+ document.getElementById("TenPhongBan").value + "&ThoiGian="
				+ document.getElementById("ThoiGian").value;

		http.open("POST", link, true);
		http.send();
	}
</script>