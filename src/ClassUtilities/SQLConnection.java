package ClassUtilities;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnection {
	public static Connection getSQLServerConnection() throws SQLException, ClassNotFoundException {
		String hostName = "QUANDINH";
		String sqlInstanceName = "SQLEXPRESS";
		String database = "QuanLyPhongBan";
		String userName = "sa";
		String password = "";
	//	System.out.println("getConnect");
		return getSQLServerConnection(hostName, sqlInstanceName, database, userName, password);
	}

	public static Connection getSQLServerConnection(String hostName, String sqlInstanceName, String database,
			String userName, String password) throws ClassNotFoundException, SQLException {

		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		String connectionURL = "jdbc:jtds:sqlserver://" + hostName + ":1433/" + database + ";instance="
				+ sqlInstanceName;
		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println(getSQLServerConnection());;
	}
}
