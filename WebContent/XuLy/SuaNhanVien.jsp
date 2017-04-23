<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="ClassUtilities.MySQLQueryUtilities"%>
<%
	String maNhanVien = request.getParameter("MaNhanVien");
	String tenNhanVien = request.getParameter("TenNhanVien");
	String diaChi = request.getParameter("DiaChi");
	MySQLQueryUtilities.updateNhanVien(maNhanVien, tenNhanVien, diaChi);
	out.write("Cập nhật nhân viên thành công!"+tenNhanVien+diaChi);
%>