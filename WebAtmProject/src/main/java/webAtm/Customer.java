package webAtm;

public class Customer {

	private String accNo;
	private String pin;
	private String name;
	private int balance;

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public void withdrawBalance(int balance) {
		this.balance -= balance;
	}

	public void depositBalance(int balance) {
		this.balance += balance;
	}

	@Override
	public String toString() {
		return "Customer [accNo=" + accNo + ", pin=" + pin + ", name=" + name + ", balance=" + balance + "]";
	}

	public Customer(String accNo, String pin, String name, int balance) {
		super();
		this.accNo = accNo;
		this.pin = pin;
		this.name = name;
		this.balance = balance;
	}

	public Customer() {

	}

}
