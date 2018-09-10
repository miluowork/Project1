package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
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
import service.address_service;
import service.ordersDetails_service;
import service.orders_service;
import service.shopCar_service;
@Controller
@RequestMapping("ShopCar")
public class shopCar_controller {
	@Autowired
	shopCar_service service;
	@Autowired
	ordersDetails_service ordService;
	@Autowired
	orders_service oService;
	@Autowired
	address_service addrService;
	
	@RequestMapping("carList")
	protected String carList(@Param("id")int user_id,ModelMap mp){
		List<shopCar> shopCarList = service.carList(user_id);
		mp.put("shopCarList",shopCarList);
		return "shopping";
    }
	@RequestMapping("delete")
    public void delete(@Param("id") Integer id){
		System.out.println(id);
		service.delete(id);
    }
	
	
	@RequestMapping("shopCarPdt")
    public @ResponseBody String shopCarPdt(@RequestBody shopCar car){
		System.out.println(car.getUser_id());
		System.out.println(car.getCount());
		String result="success";
		service.shopCarPdt(car);
		return result;
    }
	
	
	@RequestMapping("shopCarNum")
    public @ResponseBody String shopCarNum(@Param("id") Integer id,@Param("count")Integer count,HttpServletRequest req){
		String result="success";
		service.shopCarNum(id,count);
		return result;
    }
	
	@RequestMapping("payList")
	@ResponseBody
	protected String payList(@RequestBody List<shopCar> carList,HttpSession session,ModelMap mp){
		System.out.println(15929);
		ArrayList<shopCar> plist = new ArrayList<shopCar>();
		double finalNowAmount=0;//现总价
		double finalAmount=0;//原总价
		int num=carList.size();
		for(int i=0;i<num;i++) {
			int count=service.pList(carList.get(i).getId()).getCount();
			double price=service.pList(carList.get(i).getId()).getPrice();
			double nowprice=service.pList(carList.get(i).getId()).getNowprice();
		    finalNowAmount +=count*nowprice;
			finalAmount +=count*price;
			shopCar cars=service.pList(carList.get(i).getId());
			plist.add(cars);
		}
		mp.put("finalAmount",finalAmount);
		mp.put("finalNowAmount",finalNowAmount);
		toPay payList= new toPay(plist,carList,finalNowAmount,finalAmount);
		System.out.println(payList.getList().size());
		session.setAttribute("payList", payList);
		return "success";
	}
	
	
  
}
