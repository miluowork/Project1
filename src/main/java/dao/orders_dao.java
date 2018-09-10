package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.ModelMap;

import entity.operator;
import entity.orders;
import entity.product;
import util.SearchInfo;

public interface orders_dao {        
	@Select(  "select a.*,b.addr address,c.email email from orders a "
			+ "LEFT JOIN  address b on a.address_id=b.id "
			+ "LEFT JOIN `user` c on a.user_id=c.id ${where} ${limit}")
	public List<orders> select(SearchInfo info);
	
	@Select("select * from orders where id=${id};")
	public orders orderSelect(orders ord);

	@Select("select count(id) count from orders ${where} ${limit}")
	public List<orders> page(SearchInfo info);
	
	@Select("select  * from orders a where user_id=#{user_id};")
	public List<orders>userOrder(int user_id);
	
	@Select("select  *from orders where user_id=#{user_id};")
	public List<orders> uOrderList(int user_id);

	@Delete("delete from orders where id =#{id}")
	public void delete(int id);

	@Delete("delete from orders where id in (${ids})")
	public void allDelete(SearchInfo info);

	@Insert("insert into orders (date,code,amount,nowamount,address_id,user_id,assessStatus)"
			+ " values(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},#{assessStatus})")
	public void insert(orders ord);

	@Update("update orders set date=#{date},code=#{code},amount=#{amount},nowamount=#{nowamount},"
			+ "address_id=#{address_id},user_id=#{user_id},assessStatus=#{assessStatus},status=#{status},comments=#{comments} where id=#{id}")
	public void update(orders ord);
	
	@Update("update orders set status=#{status},address_id=#{address_id} where id=#{id}")
	public void status(orders ord);
	
	@Update("update orders set status=#{status} where id=#{id}")
	public void getPt(orders ord);

	@Select("select a.*,b.addr address,c.email email from orders a " 
					+ "LEFT JOIN  address b on a.address_id=b.id "  
					+ "LEFT JOIN `user` c on a.user_id=c.id where id=#{id}")
	public orders edit(int id);
}
