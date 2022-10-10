package com.library.bookOperations;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.bean.issuedbooks.IssuedBooks;
import com.library.dao.bookDao.BookDao;
import com.library.dao.studentDao.StudentDao;

/**
 * Servlet implementation class MyBooks
 */
@WebServlet("/MyBooks")
public class MyBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		
		try {
//			String student_email = request.getParameter("id");
			String student_email = (String) session.getAttribute("student_email");
			String student_id = StudentDao.getStudentId(student_email);
			List<IssuedBooks> myBooksList = BookDao.myBooks(student_id);
			
			request.setAttribute("myBooksList", myBooksList);
			request.getRequestDispatcher("student-viewmybooks.jsp").forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
