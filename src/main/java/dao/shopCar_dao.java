package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.orders;
import entity.product;
import entity.shopCar;
import entity.user;
import entity.userRg;

public interface shopCar_dao {
	
	
	@Select("select a.*,c.fullname fullname,c.nowprice nowprice ,c.pics pics ,c.price price from shopcar a \r\n" + 
			"INNER JOIN `user` b ON a.user_id=b.id \r\n" + 
			"INNER JOIN product c on a.product_id=c.id\r\n" + 
			"WHERE b.id=#{id};")
	public List<shopCar> carList(int user_id);
	
	@Select("SELECT a.*,b.count count  from product a INNER JOIN shopcar b  on a.id=b.product_id WHERE b.id=#{id};")
	public shopCar pList(int shopCar_id);
	
	@Delete("delete from shopcar where id=#{id};")
	public void delete(@Param("id") Integer id);
	
	@Delete("delete from shopcar where id=#{id};")
	public void userDelete(@Param("id")int id);
	
	@Update("update shopcar set count=#{count} where id=#{id}")
	public void shopCarNum(@Param("id") Integer id,@Param("count")Integer count);
	
	@Insert("insert into orders (date,code,amount,nowamount,address_id,user_id)"
			+ " values(#{date},#{code},#{amount},#{nowAmount},#{address_id},#{user_id})")
	public void insert(orders ord);
	
	@Insert("insert into shopcar (product_id,count,user_id)"
			+ " values(#{product_id},#{count},#{user_id})")
	public void shopCarPdt(shopCar shopcar);

}
