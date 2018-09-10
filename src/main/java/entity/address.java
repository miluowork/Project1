package entity;

public class address {
int user_id;
int status;
String name;
String zone;
String addr;
String tel;
int id;




public address(int user_id, int status, String name, String zone, String addr, String tel, int id) {
	super();
	this.user_id = user_id;
	this.status = status;
	this.name = name;
	this.zone = zone;
	this.addr = addr;
	this.tel = tel;
	this.id = id;
}
public address() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getZone() {
	return zone;
}
public void setZone(String zone) {
	this.zone = zone;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}

}
