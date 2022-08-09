package lifelineportal.dbtask;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import lifelineportal.beans.EventBean;

public class CommonTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;

	static ArrayList<EventBean> eventlist = new ArrayList<EventBean>(); // used to hold the objects

	public static ResultSet viewDonors(String sql) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps,rs in viewDonors.jsp
		}
		return rs;
	}

	public static ArrayList<EventBean> viewEvents(String sql) {
		if (!eventlist.isEmpty()) // to check whether arraylist is empty or not
		{
			eventlist.clear();
		}
		con = DbConnection.openConnection();

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String name = rs.getString("event_name");
				String venue = rs.getString("venue");
				Date d = rs.getDate("date");

				EventBean eb = new EventBean(); // creating Bean class object
				eb.setEvent_name(name); // setting values in properties
				eb.setVenue(venue);
				eb.setDate(d);

				eventlist.add(eb); // adding objects that represent rows of the table
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return eventlist;
	}
}
