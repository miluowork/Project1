package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.address;
import entity.shopCar;
import entity.user;
import service.address_service;
import util.JsonUtil.JsonInfo;

@Controller
@RequestMapping("Address")
public class address_controller {
  
	@Autowired
	address_service service;
	
	@RequestMapping("toPay")
	protected String toPay(HttpSession session,ModelMap mp){
		user us= (user) session.getAttribute("user");
		List<address> addr=service.addrList(us.getId());
		mp.put("addrList",addr);
		return "personPay";
	}
	
	@RequestMapping("addAddrs")
	protected @ResponseBody JsonInfo addAddrs(HttpSession session,ModelMap mp,@RequestBody address addr){
		int result=0;
		user us=(user) session.getAttribute("user");
		System.out.println(addr.getZone()+" "+addr.getAddr());
		addr.setUser_id(us.getId());
		if(service.addAddr(addr)==1) {
			result=1;
		}
		return new JsonInfo(result, "");
	}
	
	@RequestMapping("editAddrs")
	protected @ResponseBody JsonInfo editAddrs(HttpSession session,ModelMap mp,address addr){
		int result=0;
		user us=(user) session.getAttribute("user");
		addr.setUser_id(us.getId());
		service.editAddr(addr);
		if(service.addAddr(addr)==1) {
			result=1;
		}
		return new JsonInfo(result, "");
	}
	
}
