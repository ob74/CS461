package edu.drexel.cs461.examples;

import java.io.IOException;
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.PrintWriter;
import java.sql.*;

public class query extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
		
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain");
		req.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		String info = (String)req.getParameter("selection");
		String truck = (String)req.getParameter("truck");
		if(truck.contains("'")) {
			truck=truck.replace("'","''");
		}
		String sql = "";

		if(info.equals("location")) {
			sql += "select L.Address, L.Start_date, L.End_date from Locations L, FoodTrucks F where F.Name="+"'"+truck+"'"+ "and F.ID=L.Food_truck";
		}
		if(info.equals("hours")) {
			sql += "select H.Day, H.Start_time, H.End_time from Locations L, FoodTrucks F, Hours H where F.Name="+"'"+truck+"'"+"and F.ID=L.Food_truck and H.Location = L.Location_id";
		}
		if(info.equals("sales")) {
			sql += "select S.Date, S.Amount from Locations L, FoodTrucks F, Sales S where F.Name="+"'"+truck+"'"+"and F.ID=L.Food_truck and S.Location = L.Location_id";
		}
		if(info.equals("employees")) {
			sql += "select E.Name, E.DOB from FoodTrucks F, Employees E where F.Name="+"'"+truck+"'"+"and F.ID=E.Food_truck";
		}
		
		Connection conn = null;
		ResultSet rs = null;

		try {
			conn = Database.openDB("PgBundle");
		}catch(SQLException ex) {
			ex.printStackTrace(out);
		}catch(ClassNotFoundException ce) {
			ce.printStackTrace(out);
		}

		try {
			rs = Database.retrieveDB(conn, sql);
		}catch(SQLException ex) {
			ex.printStackTrace(out);
		}
		
		String query = "";
		query += "<table border = \'1\'>";
		try {
		if(info.equals("location")) {
			query += "<tr><th>Address</th><th>Start Date</th><th>End Date</th></tr>";
			while(rs.next()) {
				query += "<tr>" + "<th>" + rs.getString("address") + "</th>" + "<th>" + rs.getString("start_date") + "</th>" + "<th>" + rs.getString("end_date") + "</th>" + "</tr>";
			}
			query += "</table>";
		}
		if(info.equals("hours")) {
			query += "<tr><th>Day</th><th>Start Time</th><th>End Time</th></tr>";
			while(rs.next()) {
				query += "<tr>" + "<th>" + rs.getString("day") + "</th>" + "<th>" + rs.getString("start_time") + "</th>" + "<th>" + rs.getString("end_time") + "</th>" + "</tr>";
			}
			query += "</table>";		}
		if(info.equals("sales")) {
			query += "<tr><th>Date</th><th>Amount</th></tr>";
			while(rs.next()) {
				query += "<tr>" + "<th>" + rs.getString("date") + "</th>" + "<th>" + rs.getString("amount") + "</th>" + "</tr>";
			}
			query += "</table>";
		}
		if(info.equals("employees")) {
			query += "<tr><th>Name</th><th>Date of Birth</th></tr>";
			while(rs.next()) {
				query += "<tr>" + "<th>" + rs.getString("name") + "</th>" + "<th>" + rs.getString("dob") + "</th>" + "</tr>";
			}
			query += "</table>";		
		}
		resp.getWriter().write(query);
		}catch(SQLException ex) {
			ex.printStackTrace(out);
		}
		try {
			Database.closeDB(conn);
		}catch (SQLException ex) {
			ex.printStackTrace(out);
		}
	}
}