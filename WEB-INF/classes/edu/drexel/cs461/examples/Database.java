package edu.drexel.cs461.examples;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class Database {
	public static Connection openDB(String bundle) throws SQLException, ClassNotFoundException {
		ResourceBundle bundle_ = ResourceBundle.getBundle(bundle);
		String driver = "org.postgresql.Driver";
		Class.forName(driver);
		String url = "jdbc:postgresql://" + bundle_.getString("dbHost") + "/" + bundle_.getString("dbSID");
		String username = bundle_.getString("dbUser");
		String password = bundle_.getString("dbPass");

		return DriverManager.getConnection(url, username, password);
	}

	public static String testDB(Connection conn) throws SQLException {

		if(conn == null) {
			String re = "No connection";
			return re;
		}
		else {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select now()");
			String res = "";
			while (rs.next()) {
				res = "Servus: " + rs.getString("res");
			}
			rs.close();
			st.close();
			return res;
		}
	}

	public static void closeDB(Connection conn) throws SQLException {
		conn.close();
	}

	public static ResultSet retrieveDB(Connection conn, String query) throws SQLException {
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		return rs;
	}

	public static void updateDB(Connection conn, String query) throws SQLException {
		Statement st = conn.createStatement();
		st.executeUpdate(query);
		st.close();
	}
}
