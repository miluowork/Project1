package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.user;
import entity.userRg;
import service.user_service;

@Controller
@RequestMapping("User")
public class user_controller {
	@Autowired
	user_service service;
	
	@RequestMapping("uInsert")
	protected @ResponseBody String uInsert(@RequestBody userRg usR,HttpSession session){
		System.out.println(125);
		String email=usR.getEmail();
		String password=usR.getPassword();
		String password1=usR.getPassword1();
		String code=usR.getCode();
		String tel=usR.getTel();
		System.out.println(email+" "+password+" "+tel);
		user usRList=service.userList(usR.getEmail());
		String result;
		if(code.equalsIgnoreCase(session.getAttribute("randomCode").toString())) {
			if(usRList!=null){
				result="UserExit";
			}else{
			   if(password.equals(password1) ) {
			        result="success";
			        service.insert(usR);
			     }else {
				    result="PwdError";
			     }
		    }	
		}else {
			result="CodeError";
		}
		return result;
    }
	@RequestMapping("uLogin")
	protected @ResponseBody user uLogin(@RequestBody user us,HttpSession session){
		System.out.println(12385);
		String email=us.getEmail();
		String password=us.getPassword();
		System.out.println(email+" "+password);
		user usRList=service.userList(email);
		System.out.println(usRList.getPassword());
			if(usRList!=null){
				if(password.equalsIgnoreCase(usRList.getPassword())) {
					System.out.println(usRList.getComments());
					us.setResult("success");
					us.setEmail(us.getEmail());
					usRList.setEmail(email);
					session.setAttribute("user",usRList);
					session.setMaxInactiveInterval(36000);
				}else {
					us.setResult("PwdError");
				}
			}else{
				   us.setResult("UserError");
		    }	
			return us;
		}
		
	@RequestMapping("exit")
	protected String exit(ModelMap mp,HttpServletRequest req)  {
		System.out.println(123);
		HttpSession session = req.getSession(); 
		session.invalidate();
		return "redirect:../Products/picsList";
		
	}

}
