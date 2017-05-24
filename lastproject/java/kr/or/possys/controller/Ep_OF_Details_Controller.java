package kr.or.possys.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.ep_order_food_details_service.Ep_Order;
import kr.or.possys.ep_order_food_details_service.Ep_Order_Dao;
import kr.or.possys.food_service.Food;


@Controller
public class Ep_OF_Details_Controller {
	@Autowired
	Ep_Order_Dao dao = new Ep_Order_Dao();
	@RequestMapping(value="ep_order_list",method=RequestMethod.GET)
	public String ep_olist(Model model
						, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("01_ep_olist 실행 - Ep_OF_Details_Controller.java");
		int ep_ocount = dao.ep_ocount(); //중첩 없이 갯수
		int pageRow = 5; // 스크롤로 대체하면서 필요없어짐
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)ep_ocount/(double)pageRow));
		
		List<Ep_Order> list = dao.ep_olist(currentPage, pageRow);
		
		model.addAttribute("expage",expage);
//		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_ocount", ep_ocount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
		return "/wonbin/ep_order_food_details/ep_order_list";
		
	}
	//식재료 현황검색 요청
		@RequestMapping(value="/food_DT_search", method = RequestMethod.GET)
		public String foodSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="selbox") String selbox
				,@RequestParam(name="keyWord") String keyWord){
			System.out.println("02_foodSRlist 실행 - Ep_OF_Details_Controller.java");
			int ep_ocount = dao.food_DT_SRcount(selbox, keyWord);
			System.out.println(ep_ocount+"<<<<<< 검색 수");
			int pageRow = 5; // 스크롤로 대체하면서 필요없어짐 
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)ep_ocount/(double)pageRow));
			List<Ep_Order> list = dao.food_DT_SRlist(selbox, keyWord, currentPage, pageRow);
			System.out.println(list+"<asdwrw");
			model.addAttribute("expage",expage);
//			model.addAttribute("pageRow",pageRow);
			model.addAttribute("ep_ocount", ep_ocount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			
					
			return "/wonbin/ep_order_food_details/ep_order_list";
		
		}
	//발주등록 요청
		@RequestMapping(value="/food_OD_insert", method= RequestMethod.POST)
		public String od_insert(Ep_Order order
				,@RequestParam(value="ep_order_ea") List<Integer> ep_order_ea){
			System.out.println("03_od_insert 실행 - Ep_OF_Details_Controller.java");
//			System.out.println(order.getEp_id());
//			System.out.println(order.getFood_id());
			for(int a : ep_order_ea){
				System.out.println(a);
			}
			String food_ids = order.getFood_id();
			String ep_ids = order.getEp_id();
			//배열로 ","로 잘라서 문자열을 담는다.
			String[] food_id = food_ids.split(",");
			String[] ep_id = ep_ids.split(",");
			
			Ep_Order ep_o = new Ep_Order();
			for(String f : food_id){
//				System.out.println(f);
				ep_o.setFood_id(f);
				for(String e : ep_id){
					ep_o.setEp_id(e);
					dao.ep_oinset(ep_o);
				}
				
			}
			
							
			
			return null;
		}
}
