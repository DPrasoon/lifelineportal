package lifelineportal.dbtask;

import java.sql.*;

public class DbConnection {

	private static Connection con; // creating a variable of Connection interface

	public static Connection openConnection() {
		try {
			// type 4 driver -> fastest driver, purely written in Java
			Class.forName("com.mysql.cj.jdbc.Driver"); // factory methods-> forName() is used to create the object of a
														// class(here Driver class) implicitly, without using new
														// keyword
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelinedb", "root", "root"); // connection
																										// string/url is
																										// contained in
																										// "" //creating
																										// a connection
		} catch (SQLException | ClassNotFoundException cs) {
			cs.printStackTrace();
		}
		return con;
	}// method close

//	public static void main(String[] args) {
//		Connection con = DbConnection.openConnection();
//		System.out.println(con);
//	}
}
