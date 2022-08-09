package lifelineportal.dbtask;

import java.sql.*;
public class DonorTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;
	
	public static ResultSet getDonorDetails(String strsql,String id)
	{
		con=DbConnection.openConnection();
		try {
		ps=con.prepareStatement(strsql);
		
		ps.setString(1,id);
		rs=ps.executeQuery();
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		
		
		return rs;
	}
	
}
