package edu.drexel.cs461.examples;

import java.io.IOException;
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.PrintWriter;
import java.sql.*;

public class registerServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String type = (String)req.getParameter("type");
		String username = (String)req.getParameter("username");
		String password = (String)req.getParameter("password");
		String name = (String)req.getParameter("name");
		String sql = "";
		String sql_check = "";
		Connection conn = null;
		ResultSet rs = null;
		
		if(type==null) {
			out.println("You must select the type of an account. Go back and register an account.");
			out.println("<a href=\"register\">Back</a>");
		}
		else if(username.equals("")) {
			out.println("You must enter the username of an account. Go back and register an account.");
			out.println("<a href=\"register\">Back</a>");
		}
		else if(password.equals("")) {
			out.println("You must enter the password of an account. Go back and register an account.");
			out.println("<a href=\"register\">Back</a>");
		}
		else if(name.equals("")) {
			out.println("You must enter the name of an account. Go back and register an account.");
			out.println("<a href=\"register\">Back</a>");
		}
		else {
			if(type.equals("Owner")) {
				sql += "insert into Owners (Owner_id, Password, Name) values ("+"'"+username+"'"+","+"'"+password+"',"+"'"+name+"'"+")";
				sql_check += "select * from Owners where Owner_id=" + "'" + username + "'";
			}
			else {
				sql += "insert into Consumers (Consumer_id, Password, Name) values ("+"'"+username+"'"+","+"'"+password+"'," + "'"+name+"'"+")";
				sql_check += "select * from Consumers where Consumer_id=" + "'" + username + "'";
			}
	
			try {
				conn = Database.openDB("PgBundle");
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}catch(ClassNotFoundException ce) {
				ce.printStackTrace(out);
			}
			try {
				rs = Database.retrieveDB(conn, sql_check);
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}
			try {
				if(rs.next()) {
					out.println("The username already existed! Go back and create your account.");
					out.println("<a href=\"register\">Back</a>");		
				}
				else {
					Database.updateDB(conn, sql);
					out.println("Your account has been successfully created! Go back and log into your account.");
					out.println("<a href=\"http://resin.cci.drexel.edu:8080/~jw968/index\">Back</a>");
					//Database.closeDB(conn);
				}
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
		
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}