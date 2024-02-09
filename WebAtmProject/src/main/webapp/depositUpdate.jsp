<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="webAtm.Customer" %>
<%@ page import="webAtm.Customer_Dao" %>
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
	
	int depAmount =Integer.parseInt( request.getParameter("deposit"));
	
	Customer_Dao dao = new Customer_Dao();
	
	
	Customer customer = dao.getCustomer(accnum);
	
	int newAmount = customer.getBalance()+depAmount;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root", "nrajendran2");
	PreparedStatement pst = con.prepareStatement("update accounts set balance=? where accountNumber=?");
	pst.setString(2, accnum);
	pst.setInt(1, newAmount);

	pst.executeUpdate();

	%>

	
	<%@ include file="continue.jsp" %>





</body>
</html>