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
 * Servlet implementation class PayFine
 */
@WebServlet("/PayFine")
public class PayFine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayFine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session=request.getSession();
		
		String student_id = request.getParameter("student_id");
		String fine_amount = request.getParameter("fine_amount");
		
		try {
			int fine = Integer.parseInt(fine_amount);
			int payFineStatus = StudentDao.payFine(student_id, fine);
			
			if (payFineStatus > 0) {
				session.setAttribute("payFineStatus", "success");
				response.sendRedirect("fine-payfine.jsp");
			} else {
				session.setAttribute("payFineStatus", "failed");
				response.sendRedirect("fine-payfine.jsp");
			}
			
		} catch (NumberFormatException e) {
			session.setAttribute("payFineStatus", "failed");
			response.sendRedirect("fine-payfine.jsp");
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
