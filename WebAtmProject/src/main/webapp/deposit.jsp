<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("accnum") ==null){
	
	response.sendRedirect("index.jsp");
	
}

%>
	
	<form action = "depositUpdate.jsp">
	Enter the Amount you want to deposit: <input type = "text" name = "deposit">
	<input type = "submit" value = "Deposit">
	</form>

</body>
</html>