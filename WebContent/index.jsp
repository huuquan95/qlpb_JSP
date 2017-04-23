<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Chủ</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#noidung").load('TrangChu.jsp');

		$('#list_menu li a').click(function() {
			$("#noidung").load(this.id);
		});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="col-md-2">
			<img src="img/img10.png" alt="Image"
				style="width: 100%; height: auto;">
		</div>
		<div class="col-md-8 div_center_top">
			<center>
				<h1>CHƯƠNG TRÌNH QUẢN LÝ PHÒNG BAN</h1>
			</center>
		</div>
		<div class="col-md-2">
			<img src="img/img1.png" alt="Image"
				style="width: 100%; height: auto;">
		</div>
	</div>
	<div class="container">
		<div class="col-md-2">
			<ul style="list-style-type: none;" id="list_menu">
				<li><a id="TrangChu.jsp">Trang chủ</a></li>
				<li><a id="XemNhanVien.jsp">Xem nhân viên</a></li>
				<li><a id="XemPhongBan.jsp">Xem phòng ban</a></li>
				<li><a id="TimKiem.jsp">Tìm kiếm</a></li>
				<li><a id="CapNhatThongTin.jsp">Cập nhật thông tin</a></li>
				<li><a id="XoaThongTin.jsp">Xóa thông tin</a></li>
				<li><a id="XoaTatCa.jsp">Xóa tất cả</a></li>
				<li><a id="TroGiupChuongTrinh.jsp">Trợ giúp chương trình</a></li>
			</ul>
		</div>
		<div class="col-md-8 container" style="margin-top: 30px;" id="noidung">
		</div>
		<div class="col-md-2">
			<img src="img/img8.jpg" alt="Image" style="width: 100%;"> <img
				src="img/img6.jpg" alt="Image" style="width: 100%;"> <img
				src="img/img10.png" alt="Image" style="width: 100%;">
		</div>
	</div>
</body>
</html>