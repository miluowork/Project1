package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import service.product_service;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration("src/main/webapp")
@ContextConfiguration(locations = {"classpath:springmvc_servlet.xml"})
@Transactional(transactionManager="transactionManager")
@Rollback(false)

public class test {
	
	
	@Test
	public void t1() {
		System.out.println("654");
	}

}
