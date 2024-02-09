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
String accnum= (String)session.getAttribute("accnum");
Customer_Dao dao = new Customer_Dao();
Customer customer = dao.getCustomer(accnum);
dao.deleteCustomer(accnum);




%>

	<%@ include file="index.jsp" %>

</body>
</html>