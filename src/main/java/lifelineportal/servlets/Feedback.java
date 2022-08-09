package lifelineportal.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifelineportal.dbtask.DbConnection;
import java.sql.*;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nm = request.getParameter("uname");
		String mail = request.getParameter("email");
		String fb = request.getParameter("feedback");
		String rating = request.getParameter("rating");

		java.util.Date d = new java.util.Date();

		java.sql.Date sd = new java.sql.Date(d.getTime()); // convert into sql date

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into feedback(name, email, feedbacktxt, rating, date)values(?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, nm);
			ps.setString(2, mail);
			ps.setString(3, fb);
			ps.setString(4, rating);
			ps.setDate(5, sd);

			// System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();// to insert data in the donor table

			if (status > 0) {
				request.setAttribute("message", "Thanks for your feedback!"); // value can contain string as well as
																				// object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/feedback.jsp"); // to dispatch request to JSP
																							// page

				rd.forward(request, response); // always done on server side(this is server side)
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}

}
