package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.orders;
import entity.product;
import entity.user;
import service.ordersDetails_service;

@Controller
@RequestMapping("OrdersDetails")
public class ordersDetails_controller {
	@Autowired
	ordersDetails_service detailService;
	
	@RequestMapping("ordList")
	protected String ordList(ModelMap mp,HttpServletRequest req,HttpSession session){
		System.out.println(123);
		Integer order_id=Integer.parseInt(req.getParameter("order_id"));
		orders order=new orders();
		user us=(user) session.getAttribute("user");
		order.setUser_id(us.getId());
		order.setId(order_id);
		List<product> productList=detailService.oDetail(order);
		mp.put("productList", productList);
		return "settlement";
	}

}
