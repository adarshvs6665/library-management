package com.library.credentialsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.sqlConnection.SqlConnection;

public class StudentLoginDao {

	String query = "select * from student where email=? and password=?";
	String query2 = "select name from student where email=?";
	String query3 = "select id from student where email=?";
	Connection conn = null;

	public Boolean validate(String email, String password) throws SQLException {
		try {

			conn = SqlConnection.dbConnect();
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				conn.close();
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			conn.close();
		}
		return false;
	}

	public String getStudentName(String email) throws SQLException {
		try {
			conn = SqlConnection.dbConnect();
			PreparedStatement st = conn.prepareStatement(query2);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				return rs.getString("name");

			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			conn.close();
		}
		return "";
	}
	public String getStudentId(String email) throws SQLException {
		try {
			conn = SqlConnection.dbConnect();
			PreparedStatement st = conn.prepareStatement(query3);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return rs.getString("id");

			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			conn.close();
		}
		return "";
	}
}
