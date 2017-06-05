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



@Controller
public class Ep_OF_Details_Controller {
	@Autowired
	Ep_Order_Dao dao = new Ep_Order_Dao();
	
	// 발주주문 목록에서 상세보기 - 발주 재등록시 update
	@RequestMapping(value="ep_order_update",method=RequestMethod.POST)
	public String ep_order_update(Ep_Order ep_o
								,@RequestParam(value="ep_order_ea") int[] ep_order_ea){ //ep_order_ea는 자동으로 dto에 안담김
		System.out.println("07_ep_order_update 실행 - Ep_OF_Details_Controller.java");
//		System.out.println(ep_o.getEp_order_id());
//		System.out.println(ep_o.getFood_id());
		String _ep_order_id = ep_o.getEp_order_id();
		String _food_id = ep_o.getFood_id();
		String[] ep_order_id = _ep_order_id.split(",");
		String[] food_id = _food_id.split(",");
		for(int i=0; i<ep_order_id.length; i++){
			Ep_Order _ep_o = new Ep_Order();
			_ep_o.setEp_order_id(ep_order_id[i]);
			_ep_o.setFood_id(food_id[i]);
			_ep_o.setEp_order_ea(ep_order_ea[i]);
			System.out.println(_ep_o.getEp_order_id()+"<<<ep_order_id");
			System.out.println(_ep_o.getFood_id()+"<<<food_id");
			System.out.println(_ep_o.getEp_order_ea()+"<<<ep_order_ea");
			dao.ep_order_update(_ep_o);
			
		}

		return "redirect://ep_order_list";
	}
	
	//입고 목록 요청
	@RequestMapping(value="ep_wh_list",method=RequestMethod.GET)
	public String ep_wh_list(Model model
							, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("06_ep_wh_list 실행 - Ep_OF_Details_Controller.java");
		int pageRow = 50;
		int expage = 1;
		int wh_count = dao.ep_wh_conunt();
		int lastPage = (int)(Math.ceil((double)wh_count/(double)pageRow)); 
		List<Ep_Order> list = dao.ep_wh_list(currentPage, pageRow);
		model.addAttribute("list",list);
		model.addAttribute("expage",expage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("wh_count",wh_count);
		return "/wonbin/ep_order_food_details/ep_wh_list";		
	}
	
	//입고등록 액션 처리
	@RequestMapping(value="ep_order_add",method=RequestMethod.GET) // 배열방식 or 입력방식이 아니라 그런지 get으로 받음
	public String ep_o_add(@RequestParam(value="ep_order_id") String[] ep_order_id
							,@RequestParam(value="food_id") String[] food_id
							,@RequestParam(value="ep_order_wh_ea") int[] ep_order_wh_ea
							,@RequestParam(value="ep_order_food_shelflife") String[] ep_order_food_shelflife
							,@RequestParam(value="ep_order_unit_price") int[] ep_order_unit_price
							,@RequestParam(value="ep_order_total_price") int[] ep_order_total_price
							){
		System.out.println("05_ep_o_add 실행 - Ep_OF_Details_Controller.java");
		List<Ep_Order> list = new ArrayList<Ep_Order>();		
		for(int i=0; i<ep_order_id.length; i++){
			Ep_Order ep_o = new Ep_Order(); // 반복문으로 list.add에 세팅후 다시 생성자메서드로 Dto 생성
			ep_o.setEp_order_id(ep_order_id[i]);
			ep_o.setFood_id(food_id[i]);
			ep_o.setEp_order_wh_ea(ep_order_wh_ea[i]);
			ep_o.setEp_order_food_shelflife(ep_order_food_shelflife[i]);
			ep_o.setEp_order_unit_price(ep_order_unit_price[i]);
			ep_o.setEp_order_total_price(ep_order_total_price[i]);
//			System.out.println(ep_order_total_price[i]+"<<"+i+"번째 합계");
			list.add(ep_o);	
//			System.out.println(list.get(i)+"<<< list 담긴값");
		// 이방식으로 해도 되지만 일일이 dao로 보내야한다. 
//		for(String ep_o_id : ep_order_id){
//			System.out.println(ep_o_id+"<<ep_order_id");
//			ep_o.setEp_order_id(ep_o_id);			
		}
		dao.ep_o_wh_update(list);
		return "redirect:ep_order_list";
	}
	
	
	//발주 주문 리스트 요청
	@RequestMapping(value="ep_order_list",method=RequestMethod.GET)
	public String ep_o_list(Model model){
		System.out.println("04_ep_o_list 실행 - Ep_OF_Details_Controller.java");
		int _ep_o_count = 0;
		int ep_o_count = dao.ep_o_count(); // 중첩 없이 갯수
		List<Ep_Order> list = dao.ep_o_list();		
		Ep_Order ep = new Ep_Order();
		//test
//		String ep_order_id = "EPMN1705252535";
//		List<Ep_Order> _list = dao.js_ep_wh_list(ep_order_id);
//		System.out.println(_list);
		//
		for(int i=0;i<list.size();i++){
			ep = list.get(i);
			String id = ep.getEp_order_id();
//			System.out.println(ep.getEp_order_id()+"<<<< ep_order_id");
				if(id.equals("default")){
					System.out.println("default있음 - 새로운 list 객체에 no setting");
					_ep_o_count = ep_o_count -1;
					list.remove(i);
				}else{
					_ep_o_count = ep_o_count;
				}
			}		
		model.addAttribute("_ep_o_count", _ep_o_count);
		model.addAttribute("list", list);		
		return "/wonbin/ep_order_food_details/ep_order_list";
	}
	
	//식재자 현황 목록 요청
	@RequestMapping(value="ep_food_present",method=RequestMethod.GET)
	public String ep_f_present(Model model
						, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("01_ep_f_present 실행 - Ep_OF_Details_Controller.java");
		int ep_ocount = dao.ep_ocount(); //중첩 없이 갯수
//		int pageRow = 5; // 스크롤로 대체하면서 필요없어짐
//		int expage = 1;
//		int lastPage = (int)(Math.ceil((double)ep_ocount/(double)pageRow));
		
		List<Ep_Order> list = dao.ep_olist();
		//리스로 가져온 값중에 food_id를 추출하여 현재수량을 구하는 for 문
		for(Ep_Order n : list){
			List<Ep_Order> now_list = new ArrayList<Ep_Order>(); // food_id로 검색한 list를 담을 생성자 메서드
			System.out.println(n.getFood_id()+"<== 가져온 food_id");
			int add = 0;
			String food_id = n.getFood_id();
			now_list = dao.ep_now(food_id);
			for(Ep_Order e : now_list){
				System.out.println(e.getFood_nowquantity());
				add += e.getFood_nowquantity(); //변수 add에 각각의 현재수량을 더한값을 담는다.
			}
			System.out.println(add+"<== 현재수량 더한값");
			n.setFood_nowquantity(add); // i번째 Ep_order List 현재수량에 더한값을 셋팅한다. 
		}
//		model.addAttribute("expage",expage);
//		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_ocount", ep_ocount);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
		return "/wonbin/ep_order_food_details/ep_food_present";
		
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
			
					
			return "/wonbin/ep_order_food_details/ep_food_present";
		
		}
	//발주등록 요청
		@RequestMapping(value="/food_OD_insert", method= RequestMethod.POST)
		public String od_insert(Ep_Order order
				,@RequestParam(value="ep_order_ea") List<Integer> ep_order_ea){ // 수량을 List 로 받아옴
			System.out.println("03_od_insert 실행 - Ep_OF_Details_Controller.java");
			
			String food_ids = order.getFood_id();
			String ep_ids = order.getEp_id();
			
//			System.out.println(food_ids);
//			System.out.println(ep_ids);
//			System.out.println(ep_order_ea);
			//배열로 ","로 잘라서 문자열을 담는다.
			
			String[] food_id = food_ids.split(",");
			String[] ep_id = ep_ids.split(",");
						
			Ep_Order ep_o = new Ep_Order();
			for(int i=0;i<food_id.length;i++){	
					Ep_Order _ep_o = new Ep_Order(); 
					ep_o.setEp_id(ep_id[i]);
					ep_o.setFood_id(food_id[i]);
					ep_o.setEp_order_ea(ep_order_ea.get(i));//i번째 값 뽑아옴
					_ep_o = dao._ep_oinsert(ep_o);
					String ep_order_id = _ep_o.getEp_order_id();
					System.out.println(ep_order_id+"<===== ep_order_id 값 default 확인");
					if(ep_order_id.equals("default")){
						dao.default_up(ep_o);
					}else{
						dao.ep_oinsert(ep_o);
					}
			}		
			return "redirect:/ep_food_present";
		}
}
