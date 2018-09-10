package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.product;
import entity.user;
import service.product_service;
import service.user_service;
import util.SearchInfo;

	@Controller
	@RequestMapping("Products")
	public class product_controller{
		@Autowired
		product_service service;
		@Autowired
		user_service Uservice;
		
	@RequestMapping("picsList")
	protected String picsList(ModelMap mp,HttpSession session)  {
		mp.put("list", service.select());
		List<product> pt1 =service.picsList(1);
		List<product> pt2 =service.picsList(2);
		List<product> pt3 =service.picsList(3);
		List<product> pt4 =service.picsList(4);
		List<product> pt5 =service.picsList(5);
		List<product> pt6 =service.picsList(6);
		mp.put("list1",pt1);
		mp.put("list2",pt2);
		mp.put("list3",pt3);
		mp.put("list4",pt4);
		mp.put("list5",pt5);
		mp.put("list6",pt6);
		session.setAttribute("list1",pt1);
		session.setAttribute("list2",pt2);
		session.setAttribute("list3",pt3);
		session.setAttribute("list4",pt4);
		session.setAttribute("list5",pt5);
		session.setAttribute("list6",pt6);
		return "index";
	}
	
	@RequestMapping("moreList")
	protected String moreList(ModelMap mp,SearchInfo info,String txt)  {
		System.out.println(159);
		System.out.println(txt);
		if(txt==null);
			String where ="";
		if (txt!=null&&txt.length()>0) {
			where=" where b.id = '"+txt+"' ";
		}
		System.out.println(where);
		info.setWhere(where);
		List<product> pList=service.moreList(info);
		/*System.out.println(pList);*/
		/*System.out.println(pList.get(0).getFullname());*/
		mp.put("moreList",pList);
		return "productsList";
	}
	
	@RequestMapping("uLoginList")
	protected String uLoginList(HttpServletRequest req,ModelMap mp,SearchInfo info ,Integer select ,String txt,HttpSession session) {
		System.out.println("uLoginList");
		String email=req.getParameter("email");
		user uList=Uservice.userList(email);
		uList.setAddress_id(1);
		session.setAttribute("user",uList);
		session.setMaxInactiveInterval(36000);
		return "redirect:picsList";
	}
	
	
	
	
	@RequestMapping("fullnamelist")
	protected String fullnamelist(ModelMap mp ,String fullname)  {
		System.out.println(fullname);
		product pt =service.fullnamelist(fullname);
		mp.put("infos",pt);
		return "info";
	}
	
	@RequestMapping("infos")
	protected String infos(ModelMap mp,int id)  {
		List<product> pt1 =service.picsList(1);
		List<product> pt2 =service.picsList(2);
		List<product> pt3 =service.picsList(3);
		List<product> pt4 =service.picsList(4);
		List<product> pt5 =service.picsList(5);
		List<product> pt6 =service.picsList(6);
		mp.put("list1",pt1);
		mp.put("list2",pt2);
		mp.put("list3",pt3);
		mp.put("list4",pt4);
		mp.put("list5",pt5);
		mp.put("list6",pt6);
		product list=service.infos(id);
		mp.put("infos",list);
		return "info";
	}
	
	
	
	/*@RequestMapping("picsList")
	protected String picsList(ModelMap mp)  {
		System.out.println(1354);
		List<product> pt1 =service.picsList1();
		List<product> pt2 =service.picsList2();
		List<product> pt3 =service.picsList3();
		List<product> pt4 =service.picsList4();
		List<product> pt5 =service.picsList5();
		List<product> pt6 =service.picsList6();
		mp.put("list1",pt1);
		mp.put("list2",pt2);
		mp.put("list3",pt3);
		mp.put("list4",pt4);
		mp.put("list5",pt5);
		mp.put("list6",pt6);
		mp.put("num","1");
		return "index";
	}*/
	
	/*@RequestMapping("info")
	protected String info(int id,ModelMap mp,SearchInfo info ,Integer select ,String txt)  {
		System.out.println(56);
		String limit=info.getLimit();
	    if (select==null)select=0; 
		String where ="";
		Integer counts;
		if (txt!=null&&txt.length()>0) {
			switch (select) {
			case 1:
				where=" where b.name like '%"+txt+"%' ";
				System.out.println(where);
				break;
			case 2:
				where=" where a.status = '"+txt+"' " ;
				System.out.println(where);
				System.out.println(select);
				break;
			default:
				where=" where a.fullname like '%"+txt+"%' ";
				System.out.println(where);
				break;
			}
		}
		
		mp.put("select", select);
		mp.put("txt",select!=null?"'"+txt+"'":txt);
		mp.put("status", product.getStatuses());
		mp.put("priority",product.getPrioritys());
		info.setWhere(where);
//		counts=service.page(info).get(0).getCount();
//		System.out.println(counts);
		info.setMaxpage(20/info.getMax()+1);
		System.out.println(info.getMaxpage());
		System.out.println(info.getPageno()+"ҳ");
		mp.put("search", info);
		mp.put("lists", service.edit(id));
		return "Products/info";
	}
	 
	@RequestMapping("delete")
	protected String delete(int id){
		service.delete(id);
		 return "redirect:index";
	}
	@RequestMapping("allDelete")
	public String allDelete(SearchInfo info,String ids){
		System.out.println(ids);
		info.setIds(ids);
		service.allDelete(info);
		return "redirect:index";
	}


	@RequestMapping("insert")
	protected @ResponseBody JsonInfo  insert(ModelMap mp,product pt){
		System.out.println("insert");
		service.insert(pt);
		return new JsonInfo(1, "");
	}
	@RequestMapping("update")
	protected @ResponseBody JsonInfo update(product pt)  {
		service.update(pt);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("status")
	protected @ResponseBody JsonInfo status(@Param("status")Integer status,@Param("id") Integer id ,HttpServletRequest req)  {
		id=Integer.parseInt(req.getParameter("id"));
		status=Integer.parseInt(req.getParameter("status"));
		if(status==0) {
			status=1;
		}else {
			status=0;
		}
		service.status(status,id);
		return new JsonInfo(1, "");
		
		
	}
		
	@RequestMapping("edit")
	protected String edit(int id,ModelMap mp)  {
		mp.put("info",service.edit(id));
		return add(mp);
	}

	@RequestMapping("add") 
	protected String  add(ModelMap mp) {
		System.out.println("add");
		mp.put("status", product.getStatuses());
		mp.put("priority",product.getPrioritys());
		return "Products/edit";
		
	}*/

	}


