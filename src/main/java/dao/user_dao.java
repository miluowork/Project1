package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import entity.user;
import entity.userRg;

public interface user_dao {
	

	@Select("select * from  user where email=#{email};")
	public user userList(String email); 
	
	@Insert("insert into user (email,password,tel)"
			+ " values(#{email},#{password},#{tel})")
	public void insert(userRg usR);
}
