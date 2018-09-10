import java.util.Date;

import org.junit.Test;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:springmvc-servlet.xml"})
@Transactional(transactionManager="transactionManager")
@Rollback(false)
public class test {

	
	@Test
	public void exe() {
		Date date= new Date();
		System.out.println(date);
	}
}
