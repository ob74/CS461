package edu.drexel.cs461.examples;

import java.io.IOException;
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.text.*;

public class rating extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String user = (String)req.getParameter("user");
		String truck = (String)req.getParameter("trucks");
		if(truck.contains("'")) {
			truck = truck.replace("'","''");
		}
		if(truck.equals("0")) {
			out.println("You must select a food truck!");
			out.println("<a href=\"http://resin.cci.drexel.edu:8080/~jw968/user\">Back</a>");	
		}
		else {
			String user_id = "";
			String truck_id = "";
			String star = (String)req.getParameter("rating");
			String comment = (String)req.getParameter("comment");
			java.util.Date today = new java.util.Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date = df.format(today);
		
			Connection conn = null;
			ResultSet rs = null;
			//truck_id +="select C.ID as id_1, F.ID as id_2 from Consumers C, FoodTrucks F where C.Name="+"'"+user+"'"+"and F.Name="+"'"+truck+"'";
			String ids = "";
			ids +="select C.ID as id_1, F.ID as id_2 from Consumers C, FoodTrucks F where C.Name=" + "'" + user + "'" + "and F.Name=" + "'" + truck + "'";
			//out.println(ids);
			try {
				conn = Database.openDB("PgBundle");
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}catch(ClassNotFoundException ce) {
				ce.printStackTrace(out);
			}
			try {
				rs = Database.retrieveDB(conn, ids);
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}
			try {
				while(rs.next()) {
					user_id += rs.getInt("id_1");
					truck_id += rs.getInt("id_2");
				}
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}
	
			String sql = "";
			sql += "insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values (" + "'" +date+"',"+"'"+star+"',"+"'"+comment+"'," + Integer.parseInt(user_id) + "," + Integer.parseInt(truck_id) +")";
		
			try {
				Database.updateDB(conn, sql);
				out.println("Your rating has been successfully saved! Go back and leave ratings for other food trucks.");
				out.println("<a href=\"http://resin.cci.drexel.edu:8080/~jw968/user\">Back</a>");
				Database.closeDB(conn);
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}
		}
	}
		
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}