package com.library.dao.adminDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.library.sqlConnection.SqlConnection;

public class AdminDao {
	
//	static Connection conn = null;
//	
//	public static int removeLibrarian(String id) {
//		try {
//			conn = SqlConnection.dbConnect();
//			String query = "insert into librarian (`id`, `name`, `email`, `password`) VALUES (?,?,?,?)";
//			PreparedStatement st = conn.prepareStatement(query);
//			
//			st.setString(1, id);
//			
//			int flag = st.executeUpdate();
//			
//			return flag;
//		} catch (Exception e) {
//			System.out.println("Exception : " + e);
//			return -1;
//		}
//	}
}
