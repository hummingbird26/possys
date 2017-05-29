package kr.or.possys.controller;




import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.ep_order_food_details_service.Ep_Order;
import kr.or.possys.ep_order_food_details_service.Ep_Order_Dao;



@Controller
public class Ep_OF_Details_Controller {
	@Autowired
	Ep_Order_Dao dao = new Ep_Order_Dao();
	
	//���� �ֹ�����Ʈ �԰��� �� ��û AJAX
		@RequestMapping(value="/ep_wh_add_form")
		@ResponseBody
		public List<Ep_Order> ep_wh_add_form(@RequestParam(value="ep_order_id", required=true) String ep_order_id
											,HttpServletResponse response) throws Exception {
			System.out.println("05_ep_wh_add_form���� -Ep_OF_Details_Controller.java" );
//			System.out.println(ep_order_id+"<=== �����ڵ�!");
			List<Ep_Order> ep_wh_list =dao.js_ep_wh_list(ep_order_id);	
//			System.out.println(ep_wh_list+"<<<< ep_wh_list");
//			model.addAttribute("ep_wh_list",ep_wh_list);
			// jstl �� �Ѹ��� �ʹٸ� model ��ü�� ��ƾ��Ѵ�.
			return ep_wh_list;
		}
	
	//���� �ֹ� ����Ʈ ��û
	@RequestMapping(value="ep_order_list",method=RequestMethod.GET)
	public String ep_o_list(Model model){
		System.out.println("04_ep_o_list ���� - Ep_OF_Details_Controller.java");
		int _ep_o_count = 0;
		int ep_o_count = dao.ep_o_count(); // ��ø ���� ����
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
					System.out.println("default���� - ���ο� list ��ü�� no setting");
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
	
	//������ ��Ȳ ��� ��û
	@RequestMapping(value="ep_food_present",method=RequestMethod.GET)
	public String ep_f_present(Model model
						, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("01_ep_f_present ���� - Ep_OF_Details_Controller.java");
		int ep_ocount = dao.ep_ocount(); //��ø ���� ����
//		int pageRow = 5; // ��ũ�ѷ� ��ü�ϸ鼭 �ʿ������
//		int expage = 1;
//		int lastPage = (int)(Math.ceil((double)ep_ocount/(double)pageRow));
		
		List<Ep_Order> list = dao.ep_olist();
		
//		model.addAttribute("expage",expage);
//		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_ocount", ep_ocount);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
		return "/wonbin/ep_order_food_details/ep_food_present";
		
	}
	//����� ��Ȳ�˻� ��û
		@RequestMapping(value="/food_DT_search", method = RequestMethod.GET)
		public String foodSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="selbox") String selbox
				,@RequestParam(name="keyWord") String keyWord){
			System.out.println("02_foodSRlist ���� - Ep_OF_Details_Controller.java");
			int ep_ocount = dao.food_DT_SRcount(selbox, keyWord);
			System.out.println(ep_ocount+"<<<<<< �˻� ��");
			int pageRow = 5; // ��ũ�ѷ� ��ü�ϸ鼭 �ʿ������ 
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
	//���ֵ�� ��û
		@RequestMapping(value="/food_OD_insert", method= RequestMethod.POST)
		public String od_insert(Ep_Order order
				,@RequestParam(value="ep_order_ea") List<Integer> ep_order_ea){ // ������ List �� �޾ƿ�
			System.out.println("03_od_insert ���� - Ep_OF_Details_Controller.java");
			
			String food_ids = order.getFood_id();
			String ep_ids = order.getEp_id();
			
//			System.out.println(food_ids);
//			System.out.println(ep_ids);
//			System.out.println(ep_order_ea);
			//�迭�� ","�� �߶� ���ڿ��� ��´�.
			
			String[] food_id = food_ids.split(",");
			String[] ep_id = ep_ids.split(",");
						
			Ep_Order ep_o = new Ep_Order();
			for(int i=0;i<food_id.length;i++){	
					Ep_Order _ep_o = new Ep_Order(); 
					ep_o.setEp_id(ep_id[i]);
					ep_o.setFood_id(food_id[i]);
					ep_o.setEp_order_ea(ep_order_ea.get(i));//i��° �� �̾ƿ�
					_ep_o = dao._ep_oinsert(ep_o);
					String ep_order_id = _ep_o.getEp_order_id();
					System.out.println(ep_order_id+"<===== ep_order_id �� default Ȯ��");
					if(ep_order_id.equals("default")){
						dao.default_up(ep_o);
					}else{
						dao.ep_oinsert(ep_o);
					}
			}		
			return "redirect:/ep_food_present";
		}
}
