package webAtm;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends  HttpServlet{
	

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		String accnum = req.getParameter("accnum");
		
		String pin =req.getParameter("pin");
		
		
		Customer_Dao dao = new Customer_Dao();
		
		Customer customer=null;
		try {
			customer = dao.getCustomer(accnum);
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	
		if(customer.getPin()!=null) {
		if(customer != null && customer.getPin().equals(pin) ) {
			
			
			HttpSession session = req.getSession();
			
			session.setAttribute("name", customer.getName());
			session.setAttribute("accnum", customer.getAccNo());
			res.sendRedirect("welcome.jsp");
	
		}
		else {
			res.sendRedirect("error.jsp");
		}
		
		}
		else {
			res.sendRedirect("index.jsp");
		}
		
		
		
	}

}
