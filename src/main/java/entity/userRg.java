package entity;

public class userRg {
	
    String email;
    String password;
    String tel;
    String password1;
    String code;
    
    
    
	public userRg(String email, String password, String tel, String password1, String code) {
		super();
		this.email = email;
		this.password = password;
		this.tel = tel;
		this.password1 = password1;
		this.code = code;
	}
	
	public userRg() {
		super();
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
    
    
    
	
	
    
    

}
