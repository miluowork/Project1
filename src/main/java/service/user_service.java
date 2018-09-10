package service;

import entity.user;
import entity.userRg;

public interface user_service {

	public user userList(String email);
	
	
	
	public void insert(userRg usR);
}
