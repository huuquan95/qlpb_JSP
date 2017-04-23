package ClassUtilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.catalina.util.Conversions;

import DataTransferObject.NhanVien;
import DataTransferObject.PhongBan;

public class MySQLQueryUtilities {
	public static ArrayList<NhanVien> getAllNhanVien() {
		ArrayList<NhanVien> list = new ArrayList<NhanVien>();
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(
					"SELECT MaNhanVien, TenNhanVien, TenPhongBan, DiaChi FROM NHANVIEN join PhongBan on NHANVIEN.MaPhongBan=PHONGBAN.MaPhongBan");
			while (rs.next()) {
				list.add(new NhanVien(rs.getString("MaNhanVien"), rs.getString("TenNhanVien"),
						rs.getString("TenPhongBan"), rs.getString("DiaChi")));
			}
		} catch (Exception e) {
			System.err.println("Can't get All NhanVien");
		}
		return list;
	}

	public static ResultSet getAllPhongBan() {
		ResultSet rs = null;
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			rs = stm.executeQuery("SELECT* FROM PHONGBAN");
		} catch (Exception e) {
			System.err.println("Can't get All PhongBan");
		}
		return rs;
	}

	public static ResultSet getPhongBanCuThe(String maPhongBan) {
		ResultSet rs = null;
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			rs = stm.executeQuery("SELECT* FROM NHANVIEN where MaPhongBan='" + maPhongBan + "'");
		} catch (Exception e) {
			System.err.println("Can't get PhongBanCuThe");
		}
		return rs;
	}

	public static String getTenPhongBan(String maPhongBan) {
		String tenPhongBan = "";
		ResultSet rs = null;
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			rs = stm.executeQuery("SELECT* FROM PHONGBAN where MaPhongBan='" + maPhongBan + "'");
			rs.next();
			tenPhongBan = rs.getString("TenPhongBan");
		} catch (Exception e) {
			System.err.println("Can't get PhongBanCuThe");
		}
		return tenPhongBan;
	}

	public static PhongBan getPhongBan(String maPhongBan) {
		PhongBan phongBan = new PhongBan();
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("SELECT* FROM PHONGBAN where MaPhongBan='" + maPhongBan + "'");
			rs.next();
			phongBan.setMaPhongBan(rs.getString("MaPhongBan"));
			phongBan.setTenPhongBan(rs.getString("TenPhongBan"));
			phongBan.setThoigian(rs.getDate("ThoiGian"));
		} catch (Exception e) {
			System.err.println("Can't get PhongBan");
		}
		return phongBan;
	}

	public static NhanVien getNhanVien(String maNhanVien) {
		NhanVien nhanVien = new NhanVien();
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("SELECT* FROM NHANVIEN where MaNhanVien='" + maNhanVien + "'");
			rs.next();

			nhanVien.setMaNhanVien(rs.getString("MaNhanVien"));
			nhanVien.setTenNhanVien(rs.getString("TenNhanVien"));
			String maPhongBan = rs.getString("MaPhongBan");
			nhanVien.setDiaChi(rs.getString("DiaChi"));

			rs.close();
			rs = stm.executeQuery("SELECT* FROM PHONGBAN where MaPhongBan='" + maPhongBan + "'");
			rs.next();

			nhanVien.setTenPhongBan(rs.getString("TenPhongBan"));

		} catch (Exception e) {
			System.err.println("Can't get NhanVien");
		}
		return nhanVien;
	}

	public static ArrayList<NhanVien> getResultSearch(String strSearch) {
		ArrayList<NhanVien> list = new ArrayList<NhanVien>();
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(
					"SELECT MaNhanVien, TenNhanVien, TenPhongBan, DiaChi FROM NHANVIEN join PhongBan on NHANVIEN.MaPhongBan=PHONGBAN.MaPhongBan where TenNhanVien like N'%"
							+ strSearch + "%' or MaNhanVien like N'%" + strSearch + "%'");

			while (rs.next()) {
				list.add(new NhanVien(rs.getString("MaNhanVien"), rs.getString("TenNhanVien"),
						rs.getString("TenPhongBan"), rs.getString("DiaChi")));
			}
		} catch (Exception e) {
			System.err.println("Can't get All NhanVien");
		}
		return list;
	}

	public static boolean updateNhanVien(String maNhanVien, String tenNhanVien, String diaChi) {
		//System.out.println(tenNhanVien + maNhanVien);
		try {
			Connection con = MySQLConnection.getMySQLConnection();
			Statement stm = con.createStatement();
			String sql = "update NhanVien set TenNhanVien=N'" + tenNhanVien + "',DiaChi=N'" + diaChi
					+ "' where MaNhanVien='" + maNhanVien + "'";
			System.out.println(sql + "\n" + stm.executeUpdate(sql));
		} catch (Exception e) {
			System.err.println("Can't update NhanVien");
		}
		return true;
	}
}