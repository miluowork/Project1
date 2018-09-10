package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.address;

public interface address_dao {
 
	
	 @Select("select * from address WHERE user_id=#{user_id};")
	 public List<address> addrList(int user_id); 
	 
	 @Select("insert into address(user_id,zone,addr,name,tel)"
	 		+ " values(#{user_id},#{zone},#{addr},#{name},#{tel});")
	 public Integer addAddr(address addr);
	 
	 @Update("update address set zone=#{zone},addr=#{addr},name=#{name},tel=#{tel} where id=#{id}")
	 public Integer editAddr(address addr);
}
