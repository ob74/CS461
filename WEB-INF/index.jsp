<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Log-in</title>  
<!--  
<script type="text/javascript">  
    function addUser() {  
        var form = document.forms[0];  
        form.action = "${pageContext.request.contextPath}/user/login";   
        form.method = "post";  
        form.submit();  
    }  
</script>  
-->
</head>  
<body>  
    <form action="/login" method="post">  
        <table>  
            <tr>  
                <td>Username</td>  
                <td>  
                    <input type="text" name="userName">  
                </td>  
            </tr>  
            <tr>  
                <td>Password</td>  
                <td>  
                    <input type="password" name="password">  
                </td>  
            </tr>  
            <tr>  
                <td> </td>  
                <td>  
                    <input type="button" value="Submit">  
                </td>  
            </tr>  
        </table>  
    </form>  
</body>  
</html>  