package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.orders;
import entity.product;
import entity.shopCar;
import entity.userRg;

public interface shopCar_service {
	
	public List<shopCar>  carList(int user_id);
	
	public shopCar pList(int shopCar_id);
	
	public void delete(Integer id);
	
	public void userDelete(int id);
	
	public void shopCarNum(Integer id,Integer count);
	
	public void insert(orders ord);
	
	public void shopCarPdt(shopCar shopcar);
}
