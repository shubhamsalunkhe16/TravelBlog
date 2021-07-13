package com.traveller.Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static Connection con;
	static String uname = "root";
	static String password = "root";
	static String driver = "com.mysql.cj.jdbc.Driver";
	static String dbname = "traveller";
	static String url = "jdbc:mysql://localhost:3307/" + dbname;

	public static Connection getConnect() throws SQLException {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uname, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
