package lifelineportal.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifelineportal.dbtask.DbConnection;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactUs() {
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
		String name = request.getParameter("txtname");
		String email = request.getParameter("txtmail");
		String query = request.getParameter("txtquery");

//		System.out.println(name + "\n" + email + "\n" + query);

		java.util.Date d = new java.util.Date();

		java.sql.Date sd = new java.sql.Date(d.getTime());

		con = DbConnection.openConnection();

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into contactus(name, email, query, date)values(?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, query);
			ps.setDate(4, sd);

			int status = ps.executeUpdate();

			if (status > 0) {

				// value can contain string as well as object
				request.setAttribute("message", "Thank you for contacting us! We will reach you back soon.");

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/contactus.jsp"); // to dispatch request to JSP
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
