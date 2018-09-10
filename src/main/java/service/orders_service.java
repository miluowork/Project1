package service;

import java.util.List;

import entity.orders;
import entity.product;
import util.SearchInfo;

    public interface orders_service  {
    	
    	public List<orders> select(SearchInfo info);
    	
    	public orders orderSelect(orders ord);
    	
    	public List<orders> page(SearchInfo info);
    	
    	public List<orders> userOrder(int user_id);
    	
    	public List<orders> uOrderList(int user_id);

    	public void delete(int id);

    	public void allDelete(SearchInfo info);

    	public void insert(orders ord);

    	public void update(orders ord);
    	
    	public void status(orders ord);
    	
    	public void getPt(orders ord);

    	public orders edit(int id);
}
