package service;

import java.util.List;

import entity.address;

public interface address_service {

	public List<address> addrList(int user_id); 
	
	public Integer addAddr(address addr);
	
	public Integer editAddr(address addr);
}
