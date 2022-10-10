package com.library.sqlConnection;

import java.sql.*;

public class SqlConnection {

	Connection conn = null;

	public static Connection dbConnect() {
		try {
			String url = "jdbc:mysql://localhost:3306/library-management";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(url, "root", "");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
