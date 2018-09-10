package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ordersDetails_dao;
import entity.orders;
import entity.orders_details;
import entity.product;
import service.ordersDetails_service;
@Service
public class ordersDetails_serviceImp implements ordersDetails_service {
	@Autowired
	ordersDetails_dao dao ;
	public void insert(orders_details orDetail) {
		dao.insert(orDetail);
		
	}
	public List<product> oDetail(orders order) {
		return dao.oDetail(order);
	}
	
}
