package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import entity.product;
import util.SearchInfo;

    public interface product_service {
    	
    	
    	
    	public List<product> select();
    	
    	public List<product> moreList(SearchInfo info);
    	
    	public List<product> page(SearchInfo info);
    	
    	public void delete(int id);

    	public void allDelete(SearchInfo info);

    	public void insert(product pt);

    	public void update(product pt);
    	
    	public void status(int status,int id);

    	public product edit(int id);
    	
    	public List<product> picsList(int parentid);
    	
    	public product infos(int id);
    	
    	public product fullnamelist(String fullname);
    	
    	public void saleCountChange(product pt);
    	
    	
    	
    	
    
}
