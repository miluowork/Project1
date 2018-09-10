package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.shopCar_dao;
import entity.orders;
import entity.product;
import entity.shopCar;
import entity.userRg;
import service.product_service;
import service.shopCar_service;

@Service
public class shopCar_serviceImp implements shopCar_service{
	@Autowired
	shopCar_dao dao;

	public List<shopCar>  carList(int user_id) {
		return dao.carList(user_id);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}
	
	public void shopCarNum(Integer id, Integer count) {
		dao.shopCarNum(id, count);
	}
	
	public void insert(orders ord) {
		dao.insert(ord);
	}

	public void userDelete(int id) {
		dao.userDelete(id);
		
	}

	public void shopCarPdt(shopCar shopcar) {
		dao.shopCarPdt(shopcar);
		
	}

	public shopCar pList(int shopCar_id) {
		return dao.pList(shopCar_id);
	}

        
       
       
       
       
       
}
