package com.library.credentialsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.sqlConnection.SqlConnection;

public class LibrarianLoginDao {
//		public static void main(String[] args) {
//			validate();
//		}
	String query = "select * from librarian where email=? and password=?";
	Connection conn = null;
	public Boolean validate(String email,String password) throws SQLException {
		try {
			
			conn=SqlConnection.dbConnect();
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
				if (rs.next()) 
				{
					conn.close();
					return true;
				}
			} 
		catch (Exception e){System.out.println(e);}
		finally {
			conn.close();
		}
		return false;
	}
}
