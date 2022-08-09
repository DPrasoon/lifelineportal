package lifelineportal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lifelineportal.dbtask.DbConnection;

import java.sql.*;

/**
 * Servlet implementation class Donor_EditProfile
 */
@WebServlet("/Donor_EditProfile")
public class Donor_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Donor_EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("txtemail");
		String phone = request.getParameter("txtphone");
		String age = request.getParameter("txtage");
		String city = request.getParameter("txtcity");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;
		
		HttpSession hs = request.getSession(false);		//using sessionId of user to insert data in correct row of table in db
		//since it is a servlet, we must use HttpSession class, to get the session
		//we pass 'false' as a parameter so that we get the original sessionId instead of creating a new one

		String donorId = (String)hs.getAttribute("donor_sessionId");
		
		try {

			String insert_query = "update donor set email=?, phone=?, age=?, city=? where donor_id=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, email);
			ps.setString(2, phone);
			ps.setInt(3, Integer.parseInt(age));
			ps.setString(4, city);
			ps.setString(5, donorId);

			System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();// to insert data in the donor table

			if (status > 0) {
				System.out.println("Profile Edited");
				response.sendRedirect("/lifelineportal/jsp/donor/donor_home.jsp");
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
