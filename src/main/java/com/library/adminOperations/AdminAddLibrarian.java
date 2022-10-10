package com.library.adminOperations;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.librarianDao.LibrarianDao;

/**
 * Servlet implementation class AdminAddLibrarian
 */
@WebServlet("/AdminAddLibrarian")
public class AdminAddLibrarian extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddLibrarian() {
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
		
		String password = request.getParameter("password");
		String email = request.getParameter("librarian_email");
		String name = request.getParameter("librarian_name");
		String id = request.getParameter("librarian_id");
		int librarianAddStatus = LibrarianDao.addLibrarian(id, name, email, password);
		
		if (librarianAddStatus > 0) {
			session.setAttribute("librarianAddStatus", "success");
			response.sendRedirect("admin-addlibrarian.jsp");
		} else {
			session.setAttribute("librarianAddStatus", "failed");
			response.sendRedirect("admin-addlibrarian.jsp");
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
