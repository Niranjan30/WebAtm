package webAtm;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Customer_Dao {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_app", "root", "nrajendran2");
		return con;
	}

	public List<Customer> getAllCustomer() throws SQLException, ClassNotFoundException {
		List<Customer> customers = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("Select * from accounts");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Customer customer = new Customer();
			customer.setAccNo(rs.getString(1));
			customer.setPin(rs.getString(2));
			customer.setName(rs.getString(3));
			customer.setBalance(rs.getInt(4));
			customers.add(customer);
		}
		pst.close();
		con.close();

		return customers;
	}

	public int deleteCustomer(String accNo) throws ClassNotFoundException, SQLException {
		int row = 0;
		Connection con = getConnection();
		PreparedStatement smt = con.prepareStatement("Delete from accounts where accountNumber = " + accNo);
		row = smt.executeUpdate();

		smt.close();
		con.close();
		return row;
	}

	public int updateCustomer(Customer customer) throws ClassNotFoundException, SQLException {
		int row = 0;
		Connection con = getConnection();
		PreparedStatement pst = con
				.prepareStatement("Update accounts set pin=?,name=?,balance=? where accountNumber=?");
		pst.setString(1, customer.getPin());
		pst.setString(2, customer.getName());
		pst.setInt(3, customer.getBalance());
		pst.setString(4, customer.getAccNo());

		row = pst.executeUpdate();
		pst.close();
		con.close();
		return row;
	}

	public Customer getCustomer(String accNo) throws ClassNotFoundException, SQLException {

		Customer customer = new Customer();
		Connection con = getConnection();
		Statement smt = con.createStatement();
		ResultSet result = smt.executeQuery("Select * from accounts where accountNumber =" + accNo);
		if (result.next()) {
			customer.setAccNo(result.getString(1));
			customer.setPin(result.getString(2));
			customer.setName(result.getString(3));
			customer.setBalance(result.getInt(4));
		}

		smt.close();
		con.close();

		return customer;
	}

	public int saveCustomer(Customer customer) throws ClassNotFoundException, SQLException {
		int row = 0;

		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("Insert into accounts values(?,?,?,?)");
		pst.setString(1, customer.getAccNo());
		pst.setString(2, customer.getPin());
		pst.setString(3, customer.getName());
		pst.setInt(4, customer.getBalance());

		row = pst.executeUpdate();

		pst.close();
		con.close();
		return row;
	}

}
