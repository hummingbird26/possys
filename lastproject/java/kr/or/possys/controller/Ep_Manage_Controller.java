package kr.or.possys.controller;

import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.ep_order_manage_service.Ep_Manage_Dao;
import kr.or.possys.food_service.Food;



@Controller
public class Ep_Manage_Controller {
	@Autowired
	private Ep_Manage_Dao dao;
	
	@RequestMapping(value="/ep_chkbox", method = RequestMethod.POST)
	public String ep_chkbox(Model model
			,@RequestParam(value="food_id") List<String> food_id){
		System.out.println(food_id);

		List<Food> list = new ArrayList<Food>();
		for(String s : food_id){
			
			Food food = new Food();
			food.setFood_id(s);
			Food fo = dao.ep_mchck(food);
//			System.out.println(food.getFood_id()+"<<<<<<<<<<<<<<??");
			
			list.add(fo);
			model.addAttribute("list",list);
		}
//		System.out.println(list);
		

		return "/wonbin/ep_order_manage/ep_manage_add_form";
		
	}
	//��ü���� �Է��� ��û
	@RequestMapping(value="/ep_manage_add_form", method = RequestMethod.GET)
	public String ep_madd(Model model
			,@RequestParam(value="food_id") List<String> food_id){
		System.out.println("01_Ep_Manage_Controller.java ->>ep_madd �� ��û");
		
		return null/*"/wonbin/ep_order_manage/ep_manage_add_form"*/;
	}
	//��ü���� �Է¾׼� ��û
	@RequestMapping(value="/ep_manage_add_form", method = RequestMethod.POST)
	public String ep_madd(Ep_Manage ep_m
			,@RequestParam(value="food_id") List<String> food_id){
		
		System.out.println("02_Ep_Manage_Controller.java ->>ep_madd �׼� ��û");
//		System.out.println(food_id);
		List<Ep_Manage> list = new ArrayList<Ep_Manage>();
		for(String s : food_id){
//			System.out.println(s+"<<<<<<<food_id");
			Ep_Manage epm = new Ep_Manage();
			epm.setFood_id(s);
		}
		dao.insertep_m(ep_m);
		return "redirect:/ep_manage_list";
	}
	//���־�ü ��� ��û
	@RequestMapping(value="/ep_manage_list", method = RequestMethod.GET)
	public String ep_mlist(Model model
			, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("03_Ep_Manage_Controller.java ->>ep_mlist ��û");
		
		
		int ep_mcount = dao.getep_mcount();
		int pageRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)ep_mcount/(double)pageRow));
		List<Ep_Manage> list = dao.ep_mlist(currentPage, pageRow);
		
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_mcount", ep_mcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "/wonbin/ep_order_manage/ep_manage_list";
	}
	// ���־�ü ����ȭ�� ��û
	@RequestMapping(value="/ep_manage_modify_view", method = RequestMethod.GET)
	public String ep_mview(Model model, @RequestParam(value="ep_id",required=true) String ep_id){
		System.out.println("04_Ep_Manage_Controller.java ->>ep_mview ��û");
		Ep_Manage ep_m = dao.ep_mview(ep_id);
		model.addAttribute("ep_m",ep_m);
		return "/wonbin/ep_order_manage/ep_manage_modify_view";
	}
	// ���־�ü �����׼� ��û
	@RequestMapping(value="/ep_manage_modify", method = RequestMethod.POST)
	public String ep_mmodify(Ep_Manage ep_m){
		System.out.println("05_Ep_Manage_Controller.java ->>ep_mmodify ��û");
		dao.ep_mmodify(ep_m);
		return "redirect:/ep_manage_list";
		
	}
	//���־�ü ���� ��û
	@RequestMapping(value="/ep_manage_delete", method = RequestMethod.GET)
	public String ep_mdelete(@RequestParam(value="ep_id", required=true) String ep_id){
		dao.ep_mdelete(ep_id);
		return "redirect:/ep_manage_list";
	}
	//����� �˻� ��û
	@RequestMapping(value="/ep_msearch", method = RequestMethod.GET)
	public String ep_mSRlist(HttpServletRequest request
			,Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord){

		int ep_mSRcount = dao.ep_mSRlist(selbox,keyWord);
		int pageRow = 10;
		int lastPage = (int)(Math.ceil((double)ep_mSRcount/(double)pageRow));
		List<Ep_Manage> list = dao.ep_msearch(selbox, keyWord, currentPage, pageRow);
		int expage = 1;
		
		model.addAttribute("selbox",selbox);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_mcount", ep_mSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
				
		return "/wonbin/ep_order_manage/ep_manage_list";
	
	}
}
