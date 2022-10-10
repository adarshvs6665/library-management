package com.library.fineOperations;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.studentDao.StudentDao;

/**
 * Servlet implementation class ImposeFine
 */
@WebServlet("/ImposeFine")
public class ImposeFine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImposeFine() {
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
		String fine_amount = request.getParameter("fine_amount");
		
		try {
			int fine = Integer.parseInt(fine_amount);
			int imposeFineStatus = StudentDao.imposeFine(student_id, fine);
			
			if (imposeFineStatus > 0) {
				session.setAttribute("imposeFineStatus", "success");
				response.sendRedirect("fine-imposefine.jsp");
			} else {
				session.setAttribute("imposeFineStatus", "failed");
				response.sendRedirect("fine-imposefine.jsp");
			}
			
		} catch (NumberFormatException e) {
			session.setAttribute("imposeFineStatus", "failed");
			response.sendRedirect("fine-imposefine.jsp");
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
