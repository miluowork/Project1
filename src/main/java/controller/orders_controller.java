package controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.address;
import entity.costList;
import entity.orders;
import entity.orders_details;
import entity.product;
import entity.shopCar;
import entity.toPay;
import entity.user;
import service.ordersDetails_service;
import service.orders_service;
import service.product_service;
import service.shopCar_service;

	@Controller
	@RequestMapping("Orders")
	public class orders_controller{
		@Autowired
		orders_service service;
		@Autowired
		ordersDetails_service ordService;
		@Autowired
		shopCar_service carService;
		@Autowired
		product_service ptService;
		
		@RequestMapping("finalAccount")
	    public @ResponseBody String finalAccount(HttpSession session,@RequestBody address addr){
			int address_id=addr.getId();
			System.out.println("地址ID: "+address_id);
			toPay pay = (toPay)session.getAttribute("payList");
			int num=pay.getList().size();
			double finalNowAmount=pay.getFinalNowAmount();
			double finalAmount=pay.getFinalAmount();
			
			orders ord=new orders();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date  date1=new Date();
			long  date2=date1.getTime();
			String code=date2+"";
			String dt=ft.format(date1);
			user us=(user) session.getAttribute("user");//取得session对象
			ord.setDate(dt);
			ord.setCode(code);
			ord.setAmount(finalAmount);
			ord.setNowamount(finalNowAmount);
			ord.setUser_id(us.getId());
			ord.setAddress_id(address_id);
			service.insert(ord);//生成订单
			//订单生成的同时，在订单详情中添加对应数据,添加数据后，该用户的此次购物车信息（已结算部分）将被删除
			List<orders> ord1=service.userOrder(us.getId());
			orders or=ord1.get(ord1.size()-1);//该用户的最新订单记录的对象，即当前订单
			session.setAttribute("currentOrder_id",or.getId());
			System.out.println("订单id："+session.getAttribute("currentOrder_id"));
			System.out.println(or.getDate()+or.getUser_id()+or.getAddress_id()+or.getId());
			for(int i=0;i<num;i++) {
				product pt= new product();
				orders_details orderDt= new orders_details();
				orderDt.setCount(pay.getList().get(i).getCount());
				orderDt.setProduct_id(pay.getList().get(i).getId());
				orderDt.setPrice(pay.getList().get(i).getPrice()*pay.getList().get(i).getCount());
				orderDt.setNowprice(pay.getList().get(i).getNowprice()*pay.getList().get(i).getCount());
				orderDt.setOrders_id(or.getId());
			    ordService.insert(orderDt);
			    
			    int id=pay.getCarList().get(i).getId();
			    carService.userDelete(id);
			    product sePrduct=ptService.infos(pay.getList().get(i).getId());
			    System.out.println(sePrduct.getFullname());
			    int oldSalecount=sePrduct.getSalecount();
			    System.out.println(oldSalecount);
			    pt.setSalecount(pay.getList().get(i).getCount()+oldSalecount);
			    pt.setId(pay.getList().get(i).getId());
			    ptService.saleCountChange(pt);
			}
			
			return "success";
	    }
		
		@RequestMapping("uOrderList")
		protected String uOrderList(ModelMap mp,HttpSession session){
			user us=(user) session.getAttribute("user");
			int user_id=us.getId();
			List<orders> oProductList=service.uOrderList(user_id);
			mp.put("uOrderList",oProductList);
			mp.put("status",orders.getStatuses());
			return "user";
	    }
		
		@RequestMapping("productStatus")
		protected @ResponseBody Integer productStatus(@RequestBody orders ord ,HttpSession session){
			System.out.println(ord.getId());
			orders ord1=service.orderSelect(ord);
			int status=ord1.getStatus()+1;
			ord.setStatus(status);
			service.getPt(ord);
			/*orders ord1=service.orderSelect(ord);*/
			
			int newStatus=status;
			return newStatus;
	    }
		
		
		

	}


