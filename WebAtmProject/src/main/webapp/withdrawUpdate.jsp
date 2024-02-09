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
	String error = "";
	if(session.getAttribute("accnum") ==null){
		
		response.sendRedirect("index.jsp");
		
	}
	else{
	
	String accnum= (String)session.getAttribute("accnum");
	
	int withAmount =Integer.parseInt( request.getParameter("withdraw"));
	
	Customer_Dao dao = new Customer_Dao();
	
	
	Customer customer = dao.getCustomer(accnum);
	
	
	 if(withAmount%100!=0 || withAmount%500!=0)
	 {
		 error = "Invalid denomination. Please Enter correct denomination in 100 or 500";
	
	 }
				
		
	else if(withAmount >customer.getBalance())
	{
		error = "The withdrawn amount is greater than the balance you have in account." + "Please try a lower or same amount compared to your balance.";
		
		
	}
	
	else{
	
	int newAmount = customer.getBalance()-withAmount;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root", "nrajendran2");
	PreparedStatement pst = con.prepareStatement("update accounts set balance=? where accountNumber=?");
	pst.setString(2, accnum);
	pst.setInt(1, newAmount);

	pst.executeUpdate();
	}
	}

	%>
	<%=error %>

	
	<%@ include file="continue.jsp" %>

</body>
</html>