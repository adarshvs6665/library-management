package com.library.adminOperations;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.bookDao.BookDao;

/**
 * Servlet implementation class RemoveBookAdmin
 */
@WebServlet("/RemoveBookAdmin")
public class RemoveBookAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBookAdmin() {
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
		String book_id = request.getParameter("removebookadmin");
		
		int bookRemoveStatus = BookDao.removeBook(book_id);

		if (bookRemoveStatus > 0) {
			session.setAttribute("bookRemoveStatus", "success");
			response.sendRedirect("AdminBooks");
		} else {
			session.setAttribute("bookRemoveStatus", "failed");
			response.sendRedirect("AdminBooks");
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
