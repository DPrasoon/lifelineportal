package lifelineportal.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifelineportal.dbtask.DbConnection;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class AddEvents
 */
@WebServlet("/AddEvents")
public class AddEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEvents() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nm = request.getParameter("txtname");
		String venue = request.getParameter("txtvenue");
		String strdate = request.getParameter("txtdate");
		String description = request.getParameter("txtdesc");

		// converting string date to sql date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // sql uses this format, return type SDF

		java.util.Date dt = null; // return type Date
		try {
			dt = sdf.parse(strdate); // parsing String into Date type in format specified in SDF
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date s = new java.sql.Date(dt.getTime()); // converting Date type to Long type-> converting Long type
															// to SQL Date object

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into event(event_name, venue, date, description)values(?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, nm);
			ps.setString(2, venue);
			ps.setDate(3, s);
			ps.setString(4, description);

			// System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();// to insert data in the donor table

			if (status > 0) {
				request.setAttribute("message", "Event added successfully."); // value can contain string as well as
																				// object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/addevents.jsp"); // to dispatch request
																									// to JSP
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
