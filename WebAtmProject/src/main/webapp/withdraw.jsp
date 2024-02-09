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

	<form action="withdrawUpdate.jsp">
	Enter the Amount You Want to Withdraw (Enter in 100 or 500 denominations) : <input type="text" name="withdraw">
	
		<input type="submit" value="Withdraw">
	
	</form>
</body>
</html>