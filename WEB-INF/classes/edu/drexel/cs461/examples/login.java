package edu.drexel.cs461.examples;

import java.io.IOException;
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.PrintWriter;
import java.sql.*;

public class login extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String type = (String)req.getParameter("type");
		String username = (String)req.getParameter("username");
		String password = (String)req.getParameter("password");
		String sql ="";
		Connection conn = null;
		ResultSet rs = null;
		boolean isOwner = false;
		
		if(type==null) {
			out.println("You must select the type of an account. Go back and register an account.");
			out.println("<a href=\"index\">Back</a>");
		}
		else if(username.equals("")) {
			out.println("You must enter the username of an account. Go back and register an account.");
			out.println("<a href=\"index\">Back</a>");
		}
		else if(password.equals("")) {
			out.println("You must enter the password of an account. Go back and register an account.");
			out.println("<a href=\"index\">Back</a>");
		}
		else {
			if(type.equals("Owner")) {
				sql += "select * from owners where Owner_id="+"'"+username+"'";
				isOwner = true;
			}
			else {
				sql += "select * from consumers where Consumer_id="+"'"+username+"'";
			}
	
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
	
			try {
				if(rs.next())
				{ 
					if(password.equals(rs.getObject("password"))&&isOwner==true) {
						String name = rs.getString("name");
						RequestDispatcher RequestDispatcherObj = req.getRequestDispatcher("/edu/drexel/cs461/examples/owner.jsp");
						req.getSession().setAttribute("user", name);
						RequestDispatcherObj.forward(req,resp);
					}
					else if(password.equals(rs.getObject("password"))&&isOwner==false) {
						String name_2 = rs.getString("name");
						RequestDispatcher RequestDispatcherObj_2 = req.getRequestDispatcher("/edu/drexel/cs461/examples/user.jsp");
						req.getSession().setAttribute("user",name_2);
						RequestDispatcherObj_2.forward(req,resp);
					}
					else{
						out.println("Wrong password. Go back and re-enter the password.");
					}
				}
				else
				{
					out.println("This account does not exist. Go back and re-try it");
				}
			}catch(SQLException ex) {
				ex.printStackTrace(out);
			}
/*			try {
				Database.closeDB(conn);
			}catch (SQLException ex) {
				ex.printStackTrace(out);
			}*/
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}