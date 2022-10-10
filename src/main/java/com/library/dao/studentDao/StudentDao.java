package com.library.dao.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.bean.books.Book;
import com.library.bean.student.Student;
import com.library.date.GetDate;
import com.library.sqlConnection.SqlConnection;

public class StudentDao {

	

//	//For Test
//	public static void main(String[] args) throws SQLException {
//		//Test studentList() method
//		List<Student> studentList = studentList();
//		for(Student st : studentList) {
//			System.out.println(st.getId());
//			System.out.println(st.getName());
//			System.out.println(st.getEmail());
//			System.out.println(st.getDept());
//			System.out.println(st.getId());
//			System.out.println(st.getId());
//		}

//		//Test addStudent() Method
//		int flag = addStudent("18cs266","Adwait","adwaitkannan@gmail.com","123456",22,"CS");
//		System.out.print(flag);

////	Test removeStudent() Method
//	int deleteFlag = removeStudent("18cs266");
//	System.out.println(deleteFlag);

//		//Test getFine() Method
//		int fine = getFine("18cs206");
//		System.out.println("fine : " + fine);
		
//		//Test imposeFine() Method
//		int imposeFineFlag = imposeFine("18cs206",2000);
//		System.out.println("imposeFineFlag : " + imposeFineFlag);
		
//		//Test payFine() Method
//		int payFineFlag = payFine("18cs206",8000);
//		System.out.println("payFineFlag : " + payFineFlag);
//	}

	static Connection conn = null;
	
	public static List<Student> studentList() throws SQLException {

		List<Student> studentList = new ArrayList<>();

		try {
			conn = SqlConnection.dbConnect();
			String query = "select id,name,email,age,dept,joining_date,fine from student";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				Student st = new Student();
				st.setId(resultSet.getString("id"));
				st.setName(resultSet.getString("name"));
				st.setEmail(resultSet.getString("email"));
				st.setAge(resultSet.getInt("age"));
				st.setDept(resultSet.getString("dept"));
				st.setJoining_date(resultSet.getString("joining_date"));
				st.setFine(resultSet.getInt("fine"));

				studentList.add(st);
			}
			return studentList;
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}

	public static int addStudent(String id, String name, String email, String password, int age, String dept) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "insert into student (`id`, `name`, `email`, `password`, `age`, `dept`, `joining_date`, `fine`) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);

			String joining_date = GetDate.getDate();
			int fine = 0;
			st.setString(1, id);
			st.setString(2, name);
			st.setString(3, email);
			st.setString(4, password);
			st.setInt(5, age);
			st.setString(6, dept);
			st.setString(7, joining_date);
			st.setInt(8, fine);

			int flag = st.executeUpdate();

			return flag;
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			return -1;
		}
	}

	public static int removeStudent(String id) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "delete from student where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}

	public static int getFine(String id) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "select fine from student where id = '"+id+"'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			
			int fineAmount;
			
			if(resultSet.next()) {
				fineAmount = resultSet.getInt("fine");
				return fineAmount;
			}
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
			return 0;
		}
		return 0;
	}

	public static int imposeFine(String id, int fine) {
		try {
			int oldFine = getFine(id);
			int newFine = oldFine + fine;
			conn = SqlConnection.dbConnect();
			String query = "update student set fine=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, newFine);
			st.setString(2, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}

	}
	public static int payFine(String id, int amount) {
		try {
			int oldFine = getFine(id);
			int newFine = oldFine - amount;
			if(newFine < 0) {
				newFine = 0;
			}
			conn = SqlConnection.dbConnect();
			String query = "update student set fine=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, newFine);
			st.setString(2, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}
	public static Student searchStudentInList(List<Student> studentList, String id) {
		for(Student s : studentList) {
			if(s.getId().equals(id)) {
				return s;
			}
		}
		return null;
	}
	public static String getStudentId(String email) throws SQLException {
		List<Student> studentList = studentList();
		for(Student s : studentList) {
			if(s.getEmail().equals(email)) {
				return s.getId();
			}
		}
		return null;
	}
}
