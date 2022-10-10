package com.library.bookOperations;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.bookDao.BookDao;

/**
 * Servlet implementation class IssueBook
 */
@WebServlet("/IssueBook")
public class IssueBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueBook() {
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
		
		String book_id = request.getParameter("book_id");
		String student_id = request.getParameter("student_id");
		String email = request.getParameter("email");
		
		int issueBookStatus = BookDao.issueBook(book_id, student_id);
		if (issueBookStatus > 0) {
			session.setAttribute("issueBookStatus", "success");
			response.sendRedirect("managestudent-issuebook.jsp");
		} else {
			session.setAttribute("issueBookStatus", "failed");
			response.sendRedirect("managestudent-issuebook.jsp");
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
