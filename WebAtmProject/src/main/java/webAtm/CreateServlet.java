package webAtm;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/create")
public class CreateServlet extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String accNum = req.getParameter("accnum");
		String pin = req.getParameter("pin");
		String name = req.getParameter("name");
		int balance = Integer.parseInt(req.getParameter("balance"));
		boolean exists = false;
		
		Customer_Dao dao = new Customer_Dao();
		
		
		
		try {
			if(dao.getCustomer(accNum).getAccNo() !=null || pin.length() >4)
			{
				exists = true;
				res.sendRedirect("error.jsp");
				
			}
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(exists == false)
		{
			
		    Customer customer = new Customer(accNum,pin,name,balance);
			
			try {
				dao.saveCustomer(customer);
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
			
		
		res.sendRedirect("createdAccount.jsp");
		}
	}

}
