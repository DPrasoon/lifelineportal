package lifelineportal.dbtask;

import java.sql.*;

public class AdminTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public static ResultSet getAdmin(String strsql, String id) {
		con = DbConnection.openConnection();
		try {
			ps = con.prepareStatement(strsql);

			ps.setString(1, id);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return rs;
	}

	public static ResultSet viewDonors(String sql) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing ps in viewDonors.jsp
		}
		return rs;
	}
	
	public static ResultSet viewFeedback(String sql)
	{
		try
		{
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing ps in viewDonors.jsp
		}
		return rs;
	}
	
	public static ResultSet viewQueries(String sql)
	{
		try
		{
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing rs in viewQueries.jsp
		}
		return rs;
	}
	
	public static ResultSet viewEvents(String sql)
	{
		try
		{
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing rs in viewQueries.jsp
		}
		return rs;
	}
}
