<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>


<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("name") == null){
		
		response.sendRedirect("index.jsp");
	}

%>

	Welcome to Bank ATM  ${name}

	
	<form action="withdraw.jsp">
	Click Here to Withdraw : <input type="submit" value="Withdraw"> <br>
	</form>
	<form action="deposit.jsp">
	Click Here to Deposit : <input type = "submit" value = "Deposit"> <br>
	</form>
	
	<form action="balance.jsp">
	Click Here to Check for Balance : <input type = "submit" value = "BalanceCheck"> <br>
	</form>
	
	<form action="delete.jsp">
	Click Here to Delete Existing Account : <input type = "submit" value = "Delete"> <br>
	</form>
	
	<form action = "exit.jsp">
	Click Here to Exit Menu Options : <input type = "submit" value = "Exit"> <br>
	</form>
	
	
</body>
</html>