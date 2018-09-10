package serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user_dao;
import entity.orders;
import entity.user;
import entity.userRg;
import service.user_service;

@Service
public class user_serviceImp implements user_service {

	@Autowired
	user_dao dao;
	
	public user userList(String email) {
		return dao.userList(email);
	}

	public void insert(userRg usR) {
		dao.insert(usR);;		
	}

	

}
