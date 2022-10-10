package com.library.studentOperations;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.studentDao.StudentDao;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
		
		String student_id = request.getParameter("student_id");
		String name = request.getParameter("student_name");
		String age_student = request.getParameter("student_age");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			int age = Integer.parseInt(age_student);
			int addStudentStatus = StudentDao.addStudent(student_id, name, email, password, age, dept);
			
			if (addStudentStatus > 0) {
				session.setAttribute("addStudentStatus", "success");
				response.sendRedirect("managestudent-addstudent.jsp");
			} else {
				session.setAttribute("addStudentStatus", "failed");
				response.sendRedirect("managestudent-addstudent.jsp");
			}
		} catch (NumberFormatException e) {
			session.setAttribute("addStudentStatus", "failed");
			response.sendRedirect("managestudent-addstudent.jsp");
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
