package com.library.adminOperations;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.studentDao.StudentDao;

/**
 * Servlet implementation class RemoveStudentAdmin
 */
@WebServlet("/RemoveStudentAdmin")
public class RemoveStudentAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveStudentAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession();

		String id = request.getParameter("removestudentadmin");
		int removeStudentStatus = StudentDao.removeStudent(id);

		if (removeStudentStatus > 0) {
			session.setAttribute("removeStudentStatus", "success");
			response.sendRedirect("AdminStudents");
		} else {
			session.setAttribute("removeStudentStatus", "failed");
			response.sendRedirect("AdminStudents");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
