package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.address_dao;
import entity.address;
import service.address_service;

@Service
public class address_serviceImp implements address_service {
	@Autowired
	 address_dao dao ;

	public List<address> addrList(int user_id)  {
		return dao.addrList(user_id);
	}

	public Integer addAddr(address addr) {
		dao.addAddr(addr);
		return 1;		
	}

	public Integer editAddr(address addr) {
		dao.editAddr(addr);
		return 1;
	}
}
