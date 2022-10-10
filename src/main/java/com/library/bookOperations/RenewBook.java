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
 * Servlet implementation class RenewBook
 */
@WebServlet("/RenewBook")
public class RenewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RenewBook() {
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
		
		String student_id = request.getParameter("studentid");
		String book_id = request.getParameter("renewalid");
		
		int renewBookStatus = BookDao.renewBook(book_id, student_id);
		
		if (renewBookStatus > 0) {
			session.setAttribute("renewBookStatus", "success");
			response.sendRedirect("MyBooks");
		} else {
			session.setAttribute("renewBookStatus", "failed");
			response.sendRedirect("MyBooks");
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
