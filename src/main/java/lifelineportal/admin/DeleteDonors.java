package lifelineportal.admin;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifelineportal.dbtask.DbConnection;

/**
 * Servlet implementation class DeleteDonors
 */
@WebServlet("/DeleteDonors")
public class DeleteDonors extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteDonors() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		con = DbConnection.openConnection();
		String[] dId = request.getParameterValues("chkdonors"); // used to retrieve values of multiple inputs having
																// same name, returns String array

		String str_delete = "delete from donor where donor_id=?";

		PreparedStatement ps = null;

		try {
			//		con.setAutoCommit(false); 			//connection will not commit
			ps = con.prepareStatement(str_delete);

//			We don't use this method in production, as it transfers control again and again b/w program & DBMS
//			for(int i=0; i <dId.length;i++)
//			{
//				ps.setString(i, dId[i]);
//				ps.executeUpdate();
//			}

			
			
			// batch processing or batch statement
			for (int i = 0; i < dId.length; i++) {
				ps.setString(1, dId[i]);
				ps.addBatch(); // used to add the item(query) to the buffer
			}
			int[] rows = ps.executeBatch(); // used to execute whole batch present in buffer at once

			int flag = 0;
			for (int i = 0; i < rows.length; i++) {
				if (rows[i] < 0) // checking for error code(negative values)
				{
					flag = 1;
					break;
				}
			}
			if (flag == 0) //batch processing successful
			{
				//we want to commit only if all the queries executed successfully
						//con.setAutoCommit(true); //connection will commit i.e. the changes will reflect in DB
				response.sendRedirect("/lifelineportal/jsp/admin/deletedonors.jsp");
			}

			
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			se.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
