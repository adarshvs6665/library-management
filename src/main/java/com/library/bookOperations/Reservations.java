package com.library.bookOperations;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.bean.reservations.Reservation;
import com.library.bean.student.Student;
import com.library.dao.bookDao.BookDao;
import com.library.dao.studentDao.StudentDao;

/**
 * Servlet implementation class Reservations
 */
@WebServlet("/Reservations")
public class Reservations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservations() {
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
		String student_id = (String) session.getAttribute("student_id");
		
		try {
			List<Reservation> resList = BookDao.reservationsList(student_id);
//			List<Reservation> reservationList = null;
			
			if(resList == null) {
				System.out.println("null");
			} else {
//				for(Reservation r : resList) {
//					System.out.println(r.getId());
//				}
				request.setAttribute("reservationList", resList);
				request.getRequestDispatcher("student-myreservations.jsp").forward(request, response);
			}
//			for(Reservation r : resList) {
//				if(r.getStudent_id().equals(student_id)) {
////					reservationList.add(r);
//					System.out.println(r.getAuthor());
//				}
//				System.out.println(r.getAuthor());
//			}
			
			
//			request.setAttribute("reservationList", reservationList);
//			request.getRequestDispatcher("student-myreservations.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
