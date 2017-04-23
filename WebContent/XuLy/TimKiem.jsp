<%@page import="DataTransferObject.NhanVien"%>
<%@page import="java.util.ArrayList"%><%@page
	import="ClassUtilities.MySQLQueryUtilities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String strSearch = request.getParameter("strSearch");
	ArrayList<NhanVien> list = (ArrayList<NhanVien>) MySQLQueryUtilities.getResultSearch(strSearch);

	String text = "";
	if (list.size() != 0) {
		for (NhanVien nhanVien : list) {
			text += "<tr><td>" + nhanVien.getMaNhanVien() + "</td><td>" + nhanVien.getTenNhanVien() + "</td><td>"
					+ nhanVien.getTenPhongBan() + "</td><td>" + nhanVien.getDiaChi() + "</td></tr>";
		}
		;
	}
	if (text.equals("")) {
		out.write("<h3>Không tìm ra kết quả phù hợp!</h3>");
	} else {
		text = "<table class=\"table table-resposive table-hover\"><caption><h3>Danh sách nhân viên</h3></caption><tr><th>Mã nhân viên</th><th>Tên nhân viên</th><th>Phòng ban</th><th>Địa chỉ</th></tr>"
				+ text + "</table>";
		out.write(text);
	}
%>