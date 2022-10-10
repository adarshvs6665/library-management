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
 * Servlet implementation class EditBook
 */
@WebServlet("/EditBook")
public class EditBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBook() {
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
			String book_id = request.getParameter("book_id");
			String publisher = request.getParameter("publisher");
			String qty = request.getParameter("quantity");
			
			int updateBookStatus;
			if(publisher.equals("")) {
				int quantity = Integer.parseInt(qty);
				updateBookStatus = BookDao.updateBook(book_id, quantity);
			} else if(qty.equals("")) {
				updateBookStatus = BookDao.updateBook(book_id, publisher);
			} else {
				int quantity = Integer.parseInt(qty);
				updateBookStatus = BookDao.updateBook(book_id, publisher, quantity);
			}
			
			if (updateBookStatus > 0) {
				session.setAttribute("updateBookStatus", "success");
				response.sendRedirect("managebooks-editbook.jsp");
			} else {
				session.setAttribute("updateBookStatus", "failed");
				response.sendRedirect("managebooks-editbook.jsp");
			}
			
		} catch (NumberFormatException e) {
			System.out.println("Enter numeric value for quantity : " + e);
			session.setAttribute("updateBookStatus", "failed");
			response.sendRedirect("managebooks-editbook.jsp");
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
