<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Log-in</title>  
 
<script type="text/javascript">  
</script>  

</head>  
<body> 
	<center>
		<form id="login" name="login" action="./login" method="post">
			<table>
				<tr>
					<td><td><label><input name="type" type="radio" value="Owner"/>Owner</label>
					    <label><input name="type" type="radio" value="User"/>User</label>
					</td></tr>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
		<br>
			<input type="submit" value="Login">
		</form>
		<a href="register">Register</a>
</body>  
</html>  