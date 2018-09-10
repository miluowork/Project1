package entity;
public class orders {
	public  static String [] statuses={"δ֧��","��֧��","�ѷ���","���ջ�","���˻�","��ȡ��"};
	public  static String [] asStatus={"������","δ����"};
	public  static String [] dateRange={"����","������","������"};
	public static String[] getStatuses() {
		return statuses;
	}
	public static void setStatuses(String[] statuses) {
		orders.statuses = statuses;
	}
	public static String[] getAsStatus() {
		return asStatus;
	}
	public static void setAsStatus(String[] asStatus) {
		orders.asStatus = asStatus;
	}
	public static String[] getDateRange() {
		return dateRange;
	}
	public static void setDateRange(String[] dateRange) {
		orders.dateRange = dateRange;
	}


	
	int id;
	String date;
	String code;
	double amount;
	double nowamount;
	double price;
	double nowprice;
	int address_id;
	int user_id;
	int assessStatus;
	int status;
	String pics;
	String comments;
	String email;
	String address;
	
	
	
	
	public orders(int id, String date, String code, double amount, double nowamount, double price, double nowprice,
			int address_id, int user_id, int assessStatus, int status, String pics, String comments, String email,
			String address) {
		super();
		this.id = id;
		this.date = date;
		this.code = code;
		this.amount = amount;
		this.nowamount = nowamount;
		this.price = price;
		this.nowprice = nowprice;
		this.address_id = address_id;
		this.user_id = user_id;
		this.assessStatus = assessStatus;
		this.status = status;
		this.pics = pics;
		this.comments = comments;
		this.email = email;
		this.address = address;
	}
	
	
	public orders() {
		super();
	}
	public String[] getPiclist() {
		if(pics.length()<5)return new String[0];
		return pics.split(",");
	}
	public String getPic() {
		if(pics.length()<5)return null;
		String [] pic=pics.split(",");
		
		if(pic.length>0)
		return pic[0];
		else return null;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getNowprice() {
		return nowprice;
	}
	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAssessStatus() {
		return assessStatus;
	}
	public void setAssessStatus(int assessStatus) {
		this.assessStatus = assessStatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
