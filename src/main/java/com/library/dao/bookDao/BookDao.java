package com.library.dao.bookDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.bean.books.Book;
import com.library.bean.issuedbooks.IssuedBooks;
import com.library.bean.reservations.Reservation;
import com.library.bean.student.Student;
import com.library.dao.studentDao.StudentDao;
import com.library.date.GetDate;
import com.library.sqlConnection.SqlConnection;

public class BookDao {
//	public static void main(String[] args) throws SQLException {
////		Test booksList() method
//		List<Book> booksList = booksList();
//		for(Book bk : booksList) {
//			System.out.println(bk.getId());
//			System.out.println(bk.getName());
//			System.out.println(bk.getAuthor());
//			System.out.println(bk.getPublisher());
//			System.out.println(bk.getQuantity());
//			System.out.println(bk.getIssued_quantity());
//			System.out.println(bk.getAdded_date());
//		}
		
////		Test availabilityList() method
//		List<Book> booksList = availabilityList();
//		for(Book bk : booksList) {
//			System.out.println(bk.getId());
//			System.out.println(bk.getName());
//			System.out.println(bk.getAuthor());
//			System.out.println(bk.getPublisher());
//			System.out.println(bk.getQuantity());
//			System.out.println(bk.getIssued_quantity());
//			System.out.println(bk.getRemaining());
//		}
		
////		Test addBook() Method
//		int addBookFlag = addBook("bk-504","Harry Potter","JK Rowling","Bloomsbury Publishing",23);
//		System.out.print("addBookFlag : " + addBookFlag);
		
////		Test removeBook() Method
//		int removeBookFlag = removeBook("bk-502");
//		System.out.println("removeBoolFlag : " + removeBookFlag);
		
////		Test updateBook() Method
//		int updateBookFlag = updateBook("bk-504","Bloomsbury Publishers",12);
//		int updateBookFlag = updateBook("bk-504",19);
//		System.out.println("updateBookFlag : " + updateBookFlag);
		
////		Test issueBook()
//		int issueBookFlag = issueBook("bk-501","18cs206","adarshvs6665@gmail.com");
//		int issueBookFlag2 = issueBook("bk-501","18cs206","adarshvs6665@gmail.com");
//		int issueBookFlag3 = issueBook("bk-501","18cs206","adarshvs6665@gmail.com");
//		int issueBookFlag4 = issueBook("bk-501","18cs206","adarshvs6665@gmail.com");
////		int issueBookFlag = issueBook("bk-501","18cs444","adarshvs6665@gmail.com");
//		System.out.println("issueBookFlag : " + issueBookFlag);
//		System.out.println("issueBookFlag2 : " + issueBookFlag2);
//		System.out.println("issueBookFlag3 : " + issueBookFlag3);
//		System.out.println("issueBookFlag4 : " + issueBookFlag4);
		
////		Test viewIssuedBooks() method
//		List<IssuedBooks> issuedBooksList = viewIssuedBooks();
//		for(IssuedBooks bk : issuedBooksList) {
//			System.out.println(bk.getId());
//			System.out.println(bk.getBook());
//			System.out.println(bk.getStudent_id());
//			System.out.println(bk.getStudent_name());
//			System.out.println(bk.getEmail());
//			System.out.println(bk.getDept());
//			System.out.println(bk.getIssued_date());
//			System.out.println(bk.getRenewal_date());
//			System.out.println(bk.getIssue_no());
//			System.out.println("\n\n");
//		}
		
////		Test returnBook() Method
//		int returnBookFlag = returnBook("bk-501","18cs206");
//		System.out.println("returnBookFlag : " + returnBookFlag);
		
////		Test reserveBook() Method
//		int reserveBookFlag = reserveBook("bk-501","18cs206");
//		System.out.println("reserveBookFlag : " + reserveBookFlag);
		
////		Test reservationsList() method
//		List<Reservation> reservationsList = reservationsList();
//		for(Reservation bk : reservationsList) {
//			System.out.println(bk.getId());
//			System.out.println(bk.getBook());
//			System.out.println(bk.getStudent_id());
//			System.out.println(bk.getAuthor());
//			System.out.println(bk.getPublisher());
//			System.out.println(bk.getStudent_id());
//			System.out.println(bk.getStatus());
//			System.out.println("\n\n");
//		}
//	
////		Test renewBook)()
//		System.out.println(renewBook("bk-501","18cs206"));
//}
	
	static Connection conn = null;
	final static int RENEWAL_DATE_INC = 15;
	
	public static List<IssuedBooks> myBooks(String student_id) throws SQLException {
		List<IssuedBooks> allBooks = viewIssuedBooks();
		List<IssuedBooks> myBooks = new ArrayList<>();
		for(IssuedBooks i : allBooks) {
			if(i.getStudent_id().equals(student_id)) {
				myBooks.add(i);
			}
		}
		return myBooks;
	}
	public static List<Book> availabilityList() throws SQLException {

		List<Book> booksList = new ArrayList<>();

		try {
			conn = SqlConnection.dbConnect();
			String query = "select id,name,author,publisher,quantity,issued_quantity from books";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				Book bk = new Book();
				bk.setId(resultSet.getString("id"));
				bk.setName(resultSet.getString("name"));
				bk.setAuthor(resultSet.getString("author"));
				bk.setPublisher(resultSet.getString("publisher"));
				int qty = resultSet.getInt("quantity");
				int issued_qty = resultSet.getInt("issued_quantity");
				bk.setQuantity(qty);
				bk.setIssued_quantity(issued_qty);
				int remaining = qty - issued_qty;
				bk.setRemaining(remaining);

				booksList.add(bk);
			}
			return booksList;
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}
	
	public static List<Reservation> reservationsList(String student_id) throws SQLException {

		List<Reservation> reservationList = new ArrayList<>();

		try {
			conn = SqlConnection.dbConnect();
			String query = "SELECT `id`, `book`, `author`, `publisher`,`student_id` FROM `reservations` where `student_id`='"+student_id+"'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				Reservation bk = new Reservation();
				bk.setId(resultSet.getString("id"));
				bk.setBook(resultSet.getString("book"));
				bk.setAuthor(resultSet.getString("author"));
				bk.setPublisher(resultSet.getString("publisher"));
				bk.setStudent_id(resultSet.getString("student_id"));
				bk.setStatus("Reserved");

				reservationList.add(bk);
			}
			return reservationList;
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}
	
	public static int reserveBook(String book_id, String student_id) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "INSERT INTO `reservations`(`id`, `book`, `author`, `publisher`, `student_id`) VALUES (?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);
			
			List<Book> bookList = booksList();
			Book book = searchBookInList(bookList, book_id);
			String bookName = book.getName();
			String author = book.getAuthor();
			String publisher = book.getPublisher();
			

			
			st.setString(1, book_id);
			st.setString(2, bookName);
			st.setString(3, author);
			st.setString(4, publisher);
			st.setString(5, student_id);

			int flag = st.executeUpdate();
			
			// getting issued_quantity from book table
			String query2 = "SELECT `issued_quantity`,`quantity` FROM `books` WHERE `id`='"+book_id+"'";
			Statement statement1 = conn.createStatement();
			ResultSet resultSet1 = statement1.executeQuery(query2);
			int issued_quantity = 0;
			int quantity = 0;
			while(resultSet1.next()) {
				issued_quantity = issued_quantity + resultSet1.getInt("issued_quantity");
				quantity = quantity + resultSet1.getInt("quantity");
			}
			int remaining_quantity = quantity - issued_quantity;
			
			if(remaining_quantity == 0) {
				return -1;
			}
			issued_quantity = issued_quantity + 1;
			
			// updating issued_quantity in book table
			String query3 = "update books set issued_quantity=? where id=?";
			PreparedStatement st2 = conn.prepareStatement(query3);
			st2.setInt(1, issued_quantity);
			st2.setString(2, book_id);

			int flag2 = st2.executeUpdate();
			
			return flag;
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			return -1;
		}
		
	}
	
	public static List<Book> booksList() throws SQLException {

		List<Book> booksList = new ArrayList<>();

		try {
			conn = SqlConnection.dbConnect();
			String query = "select id,name,author,publisher,quantity,issued_quantity,added_date from books";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				Book bk = new Book();
				bk.setId(resultSet.getString("id"));
				bk.setName(resultSet.getString("name"));
				bk.setAuthor(resultSet.getString("author"));
				bk.setPublisher(resultSet.getString("publisher"));
				bk.setQuantity(resultSet.getInt("quantity"));
				bk.setIssued_quantity(resultSet.getInt("issued_quantity"));
				bk.setAdded_date(resultSet.getString("added_date"));

				booksList.add(bk);
			}
			return booksList;
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}
	public static int addBook(String id, String name, String author, String publisher, int quantity) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "insert into books (`id`, `name`, `author`, `publisher`, `quantity`, `issued_quantity`, `added_date`) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);

			String added_date = GetDate.getDate();
			int issued_quantity = 0;
			
			st.setString(1, id);
			st.setString(2, name);
			st.setString(3, author);
			st.setString(4, publisher);
			st.setInt(5, quantity);
			st.setInt(6, issued_quantity);
			st.setString(7, added_date);

			int flag = st.executeUpdate();

			return flag;
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			return -1;
		}
	}
	public static int removeBook(String id) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "delete from books where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}
	public static int updateBook() {
		return 1;
	}
	public static int updateBook(String id, String publisher, int quantity) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "update books set publisher=?,quantity=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, publisher);
			st.setInt(2, quantity);
			st.setString(3, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}

	}
	public static int updateBook(String id, int quantity) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "update books set quantity=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, quantity);
			st.setString(2, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}

	}
	public static int updateBook(String id, String publisher) {
		try {
			conn = SqlConnection.dbConnect();
			String query = "update books set publisher=? where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, publisher);
			st.setString(2, id);

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}

	}
	public static int returnBook(String book_id, String student_id) { // success -> 1 // unsuccess -> 0 // failed -> -1
		try {
			String issue_no = student_id + book_id;
			conn = SqlConnection.dbConnect();
			String query = "DELETE FROM `issued-books` WHERE issue_no=?";
			
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, issue_no);

			int flag = st.executeUpdate();
			int issued_quantity = 0;
			int quantity = 0;
	
			
			// getting issued_quantity from book table
			String query2 = "SELECT `issued_quantity`,`quantity` FROM `books` WHERE `id`='"+book_id+"'";
			Statement statement1 = conn.createStatement();
			ResultSet resultSet1 = statement1.executeQuery(query2);
			while(resultSet1.next()) {
				issued_quantity = issued_quantity + resultSet1.getInt("issued_quantity");
				quantity = quantity + resultSet1.getInt("quantity");
			}
			
			
			
			
			issued_quantity = issued_quantity - flag;
			if(issued_quantity < 0) {
				issued_quantity = 0;
			}
//			System.out.println(" flag = " + flag);
//			System.out.println(" issued qty before uploading : " +issued_quantity);
			
			
			// updating issued_quantity in book table
			String query3 = "update books set issued_quantity=? where id=?";
			PreparedStatement st2 = conn.prepareStatement(query3);
			st2.setInt(1, issued_quantity);
			st2.setString(2, book_id);
			
			st2.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}
	public static List<IssuedBooks> viewIssuedBooks() throws SQLException {

		List<IssuedBooks> issuedBooksList = new ArrayList<>();

		try {
			conn = SqlConnection.dbConnect();
			String query = "SELECT `id`, `book`, `student_id`, `student_name`, `email`, `dept`, `issued_date`, `renewal_date`, `issue_no` FROM `issued-books`";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				IssuedBooks isb = new IssuedBooks();
				isb.setId(resultSet.getString("id"));
				isb.setBook(resultSet.getString("book"));
				isb.setStudent_id(resultSet.getString("student_id"));
				isb.setStudent_name(resultSet.getString("student_name"));
				isb.setEmail(resultSet.getString("email"));
				isb.setDept(resultSet.getString("dept"));
				isb.setIssued_date(resultSet.getString("issued_date"));
				isb.setRenewal_date(resultSet.getString("renewal_date"));
				isb.setIssue_no(resultSet.getString("issue_no"));
				

				issuedBooksList.add(isb);
			}
			return issuedBooksList;
		} catch (Exception e) {
			System.out.println("Exception occured : " + e);
		}
		return null;
	}

	public static int issueBook(String book_id, String student_id) {
		try {
			conn = SqlConnection.dbConnect();
			
			
			//Searches for book 
			List<Book> bookList = booksList();
			
			Book book = searchBookInList(bookList, book_id);
			if(book == null) {
				System.out.println("Book doesn't exist");
				return -1; //Book doesn't exist
			}
			String book_name = book.getName();
			
			//Searches for student
			List<Student> studentList = StudentDao.studentList();
			Student student = StudentDao.searchStudentInList(studentList, student_id);
			if(student == null) {
				System.out.println("Student doesn't exist");
				return -1; //Student doesn't exist
			}
			String student_name = student.getName();
			String student_email = student.getEmail();
			String student_department = student.getDept();
			
			String issued_date = GetDate.getDate();
			String renewal_date = GetDate.incrementDate(issued_date, RENEWAL_DATE_INC); //Renewal date is 15 days after issue
			
			String issue_number = student_id + book_id;
			
			
			String query = "INSERT INTO `issued-books`(`id`, `book`, `student_id`, `student_name`, `email`, `dept`, `issued_date`, `renewal_date`, `issue_no`) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query);

			String added_date = GetDate.getDate();
			int issued_quantity=0;
			int quantity=0;
			
			// getting issued_quantity from book table
			String query2 = "SELECT `issued_quantity`,`quantity` FROM `books` WHERE `id`='"+book_id+"'";
			Statement statement1 = conn.createStatement();
			ResultSet resultSet1 = statement1.executeQuery(query2);
			while(resultSet1.next()) {
				issued_quantity = issued_quantity + resultSet1.getInt("issued_quantity");
				quantity = quantity + resultSet1.getInt("quantity");
			}
			
			
			
			
			issued_quantity = issued_quantity + 1;
			
			if(issued_quantity>quantity) {
				return -1;
			}
			
			// updating issued_quantity in book table
			String query3 = "update books set issued_quantity=? where id=?";
			PreparedStatement st2 = conn.prepareStatement(query3);
			st2.setInt(1, issued_quantity);
			st2.setString(2, book_id);

			int flag2 = st2.executeUpdate();
			
			st.setString(1, book_id);
			st.setString(2, book_name);
			st.setString(3, student_id);
			st.setString(4, student_name);
			st.setString(5, student_email);
			st.setString(6, student_department);
			st.setString(7, issued_date);
			st.setString(8, renewal_date);
			st.setString(9, issue_number);

			int flag = st.executeUpdate();

			return flag;
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			return -1;
		}
	}
	public static Book searchBookInList(List<Book> books, String id) {
		for(Book b : books) {
			if(b.getId().equals(id)) {
				return b;
			}
		}
		return null;
	}
	public static int renewBook(String book_id, String student_id) {
		try {
			conn = SqlConnection.dbConnect();
			
			String issue_no = student_id + book_id;
			String query = "SELECT `renewal_date` FROM `issued-books` WHERE `issue_no`='"+issue_no+"'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			String oldRenewalDate = null;
			while (resultSet.next()) {
				oldRenewalDate = resultSet.getString("renewal_date");
				
			}
			
			String newRenewalDate = GetDate.incrementDate(oldRenewalDate, RENEWAL_DATE_INC);
			
			String query2 = "UPDATE `issued-books` SET `renewal_date`=? WHERE `issue_no`=?";
			PreparedStatement st = conn.prepareStatement(query2);
			st.setString(1, newRenewalDate);
			st.setString(2, issue_no);
			

			int flag = st.executeUpdate();
			return flag;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
		
	}
}
