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
function queryInfo(info) {
	var y = info;
	var URL = "http://resin.cci.drexel.edu:8080/~jw968/query";
	$.ajax({
			type:"POST",
			url:URL,
			data:{selection:y, truck:$('#trucks').val()},
			cache:false,
			success:function(data) {
				document.getElementById("info").innerHTML = data;
			},
			error:function() {
				alert("Query Failed.");
			}
	});
}
</script> 
<script type="text/javascript">  
function getInfo() {
	var x = document.getElementById("trucks").value;
	if(x=="0") {
		document.getElementById("myDiv").innerHTML="";
		document.getElementById("info").innerHTML="";

	}
	else
	{
		document.getElementById("myDiv").innerHTML = "<input id=\"location\" type=\"button\" value=\"Location\" onclick=\"queryInfo(id)\">&nbsp;&nbsp;&nbsp"+
		"<input id=\"hours\" type=\"button\" value=\"Hours\" onclick=\"queryInfo(id)\">&nbsp;&nbsp;&nbsp"+
		"<input id=\"sales\" type=\"button\" value=\"Sales\" onclick=\"queryInfo(id)\">&nbsp;&nbsp;&nbsp"+
		"<input id=\"employees\" type=\"button\" value=\"Employees\" onclick=\"queryInfo(id)\">";
	}
}
</script> 
</head>  

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String)session.getAttribute("user");

		String trucks = "select F.name as name from FoodTrucks F, Owners O where O.Name=" + "'"+ name + "'" + "and O.ID=F.Owner";
		Connection conn = db.openDB("PgBundle");
		ResultSet rs = db.retrieveDB(conn,trucks);
	%>
	<h1>Hello, <%=name%></h1>
	<h3>Your food trucks</h3>
	<select name="trucks" id="trucks" onchange="getInfo()">
	<option value="0">Please select one</option>
	<%
	while(rs.next()) { %>
		<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
	<% }
	rs.close();
	%>
	</select><br><br>
	<div id="myDiv"></div>
	<p></p>
	<div id="info"></div>
	<a href="/~jw968/index">Log out</a>
</body>  
</html> 