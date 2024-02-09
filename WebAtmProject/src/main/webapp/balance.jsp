<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "webAtm.Customer"
    import = "webAtm.Customer_Dao"%>
    
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
	
}

String accnum= (String)session.getAttribute("accnum");



Customer_Dao dao = new Customer_Dao();


Customer customer = dao.getCustomer(accnum);

int balance = customer.getBalance();


%>

The amount of balance that you have in your bank account is : <%=balance %>


<%@ include file="continue.jsp" %>





</body>
</html>