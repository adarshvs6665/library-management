package com.library.bookOperations;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.bookDao.BookDao;

/**
 * Servlet implementation class AddNewBook
 */
@WebServlet("/AddNewBook")
public class AddNewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewBook() {
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
		
		String id = request.getParameter("book_id");
		String name = request.getParameter("book_name");
		String author = request.getParameter("book_author");
		String publisher = request.getParameter("book_publisher");
		String qty = request.getParameter("quantity");
		
		try {
			int quantity = Integer.parseInt(qty);
			int addBookStatus = BookDao.addBook(id, name, author, publisher, quantity);
			if (addBookStatus > 0) {
				session.setAttribute("bookAddedStatus", "success");
				response.sendRedirect("managebooks-addnewbook.jsp");
			} else {
				session.setAttribute("bookAddedStatus", "failed");
				response.sendRedirect("managebooks-addnewbook.jsp");
			}
		} catch (NumberFormatException e) {
			session.setAttribute("bookAddedStatus", "failed");
			response.sendRedirect("managebooks-addnewbook.jsp");
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
