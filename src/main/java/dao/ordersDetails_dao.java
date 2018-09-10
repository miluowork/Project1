package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import entity.orders;
import entity.orders_details;
import entity.product;

public interface ordersDetails_dao {
	@Insert("insert into orders_details (orders_id,product_id,count,price,nowprice)"
			+ " values(#{orders_id},#{product_id},#{count},#{price},#{nowprice})")
	public void insert(orders_details orDetail);
	
	@Select("select c.*,a.count count  from orders_details a \r\n" + 
			"INNER JOIN orders b on a.orders_id=b.id\r\n" + 
			"INNER JOIN product c on c.id=a.product_id\r\n" + 
			"where b.user_id=#{user_id} AND b.id=#{id};")
	public List<product> oDetail(orders order);
}
