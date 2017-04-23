<%@page import="DataTransferObject.NhanVien"%>
<%@page import="ClassUtilities.MySQLQueryUtilities"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="div_center_mid">
	<h2>Cập nhật thông tin nhân viên</h2>
	<%
		String maNhanVien = request.getParameter("MaNhanVien");
		NhanVien nhanVien = MySQLQueryUtilities.getNhanVien(maNhanVien);
		if (nhanVien.getMaNhanVien() != "") {
	%>
	<form method="post" class="form-horizontal" style="margin-top: 50px;">
		<div class="form-group">
			<label class="col-sm-3 control-label">Mã nhân viên:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="MaNhanVien"
					value="<%=nhanVien.getMaNhanVien()%>" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Tên nhân viên:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="TenNhanVien"
					value="<%=nhanVien.getTenNhanVien()%>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Tên phòng ban:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text"
					value="<%=nhanVien.getTenPhongBan()%>" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Địa chỉ:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="DiaChi"
					value="<%=nhanVien.getDiaChi()%>">
			</div>
		</div>
		<div style="text-align: center;">
			<input class="btn" type="button" value="Cập nhật" name="btn"
				onclick="save()">
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

		link = "XuLy\\SuaNhanVien.jsp?MaNhanVien="
				+ document.getElementById("MaNhanVien").value + "&TenNhanVien="
				+ document.getElementById("TenNhanVien").value + "&DiaChi="
				+ document.getElementById("DiaChi").value;
		alert(link);
		http.open("POST", link, true);
		
		http.send();
	}
</script>