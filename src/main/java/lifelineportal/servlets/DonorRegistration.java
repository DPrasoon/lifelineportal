package lifelineportal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifelineportal.dbtask.DbConnection;

import java.sql.*;

/**
 * Servlet implementation class DonorRegistration
 */
@WebServlet("/DonorRegistration")
public class DonorRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DonorRegistration() {
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
		String id = request.getParameter("txtid");
		String name = request.getParameter("txtname");
		String pass = request.getParameter("txtpass");
		String email = request.getParameter("txtmail");
		String phone = request.getParameter("txtphone");
		String age = request.getParameter("txtage");
		String gender = request.getParameter("gender");
		String bgroup = request.getParameter("cmbgroup");
		String city = request.getParameter("cmbcity");

		java.util.Date d = new java.util.Date();	//gets system date

		java.sql.Date sd = new java.sql.Date(d.getTime()); // convert into sql date

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into donor(donor_id, donor_pass, name, age, email, gender, phone, bloodgroup, city, date)values(?,?,?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setInt(4, Integer.parseInt(age));
			ps.setString(5, email);
			ps.setString(6, gender);
			ps.setString(7, phone);
			ps.setString(8, bgroup);
			ps.setString(9, city);
			ps.setDate(10, sd);

			//System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();// to insert data in the donor table

			if (status > 0) {
				System.out.println("Registration done");
				response.sendRedirect("/lifelineportal/jsp/donor/login.jsp");
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
