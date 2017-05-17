<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<jsp:useBean id="db" class="edu.drexel.cs461.examples.Database" scope="page"/>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Owner</title>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">  
</script>  
</head>  

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String)session.getAttribute("user");

		String trucks = "select name as name from FoodTrucks";
		Connection conn = db.openDB("PgBundle");
		ResultSet rs = db.retrieveDB(conn,trucks);
	%>
	<h1>Hello, <%=name%></h1>
	<h3>Rate a food truck</h3>
	<form id="rate" name="rate" action="./rating" method="post">
	<select name="trucks" id="trucks">
	<option value="0">Please select one</option>
	<%
	while(rs.next()) { %>
		<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
	<% }
	rs.close();
	%>
	</select><br><br>
	Ratings:
	<select name="rating" id="rating">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select>
	<br>
	Comments:<br>
	<input type="hidden" name="user" value="<%=name%>">
	<textarea rows="4" cols="50" id="comment" name="comment" value = "Leave your comments here...">Leave your comments here...</textarea><br>
	<input type="submit" value="Submit">
	<a href="/~jw968/index">Log out</a>
	</form>
</body>  
</html> 