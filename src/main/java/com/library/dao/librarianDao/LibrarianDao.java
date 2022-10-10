package com.library.dao.librarianDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.bean.librarian.Librarian;
import com.library.sqlConnection.SqlConnection;

public class LibrarianDao {
	static Connection conn = null;
////	For Test
//	public static void main(String[] args) throws SQLException {
////		Test librarianList() method
//		List<Librarian> librarianList = librarianList();
//		for(Librarian lib : librarianList) {
//			System.out.println(lib.getId());
//			System.out.println(lib.getName());
//			System.out.println(lib.getEmail());
//		}
//		
////		Test addLibrarian() Method
//		int flag = addLibrarian("libid-205","Ram","ram@gmail.com","123456");
		
////		Test removeLibrarian() Method
//		int deleteFlag = removeLibrarian("libid-205");
//		System.out.println(deleteFlag);
		
//	}
	
	public static List<Librarian> librarianList() throws SQLException {
		
		List<Librarian> librarianList = new ArrayList<>();
		
		try {
			conn = SqlConnection.dbConnect();
			String query = "select id,name,email,password from librarian";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			
			while(resultSet.next()) {
				Librarian lib = new Librarian();
				lib.setId(resultSet.getString("id"));
				lib.setName(resultSet.getString("name"));
				lib.setEmail(resultSet.getString("email"));
				lib.setPassword(resultSet.getString("password"));
				
				librarianList.add(lib);
			}
			return librarianList;
		} catch(Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}
	
	public static int addLibrarian(String id,String name,String email,String password) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "insert into librarian (`id`, `name`, `email`, `password`) VALUES (?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, id);
			st.setString(2, name);
			st.setString(3, email);
			st.setString(4, password);
			
			int flag = st.executeUpdate();
			
			return flag;
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			return -1;
		}
	}
	public static int removeLibrarian(String id) {
		try {
			conn=SqlConnection.dbConnect();
			String query="delete from librarian where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, id);
			
			int flag = st.executeUpdate();
			return flag;
		}
		 catch (Exception e) {
			 System.out.println(e);
			 return -1;
		}
	}
	
}
