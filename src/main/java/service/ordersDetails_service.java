package service;

import java.util.List;

import entity.orders;
import entity.orders_details;
import entity.product;

public interface ordersDetails_service {

	public void insert(orders_details orDetail);
	
	public List<product> oDetail(orders order);
}
