package kr.or.possys.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.possys.Menu_service.Menu;
import kr.or.possys.Menu_service.Menu_Dao;

import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;



@Controller
public class Order_Controller{
	@Autowired
	private Order_Dao odao;


	@RequestMapping(value="/order_list", method = RequestMethod.GET)
	public String order_list(Model model){
		System.out.println("오더리스트 요청");
		List<Order> list = odao.order_list();
		model.addAttribute("order_list", list);
		return "/order/order_list";
	}
	

	
	@RequestMapping(value="/order_detail", method = RequestMethod.GET)
	public String order_detail(Model model,@RequestParam(value="table_order_id") String table_order_id){
		System.out.println("주문상세 요청");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_detail";
	}
	
	@RequestMapping(value="/order_end_t", method = RequestMethod.GET)
	public String order_end_t(Model model,@RequestParam(value="table_order_id") String table_order_id){
		System.out.println("주문처리");
		odao.order_end_t(table_order_id);
		return "redirect:/order_list";
	}
	
	@RequestMapping(value="/order_modify_action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_modify_action(Order order){
		System.out.println("수정처리");
		
		/*List<Order> list = new ArrayList<Order>();*/
		
		odao.order_detail_delete(order.getTable_order_id());
		if(order.getMenu_id() != null){
		String [] menu_id = order.getMenu_id().split(",");
		String [] menu_name = order.getMenu_name().split(",");
		String [] order_detail_ea = order.getOrder_detail_ea().split(",");
		String [] order_detail_sum = order.getOrder_detail_sum().split(",");
		
		
		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			odao.order_detail_insert(order2);
			System.out.println(order2.getMenu_id()+order2.getTable_order_id());
		}
		
		}
		
/*		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			odao.order_detail_modify(order2);
			System.out.println(order2.getMenu_id()+order2.getTable_order_id());

		}*/

		
		
		return "redirect:/order_list";
	}
	
	
	@RequestMapping(value="/order_modify_form", method = RequestMethod.GET)
	public String order_modify_form(Model model,@RequestParam(value="table_order_id") String table_order_id,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("주문수정폼 요청");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		for(int i = 0; i< list.size(); i++){
			String menu_id = list.get(i).getMenu_id();
			String menu_price =odao.get_price(menu_id);
			list.get(i).setMenu_price(menu_price);
			System.out.println(list.get(i).getMenu_price()+"가격");
		}
		//메뉴목록시작
		List<Menu> menu_list = odao.menu_list();

		model.addAttribute("menu_list", menu_list);
		//메뉴목록끝
		
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_modify_form";
		
	}

	@RequestMapping(value="/order_file", method = RequestMethod.GET)
	public String order_file(Model model){

		return "/order/file";
	}
	
	@RequestMapping(value="/order_insert", method = RequestMethod.POST)
    public String order_file_insert(Order order, HttpServletRequest request, HttpSession session){
        
        String path = request.getRealPath("/resources/upload");
        String path2 = request.getContextPath()+"/resources/upload";
        System.out.println(path);
        System.out.println(path2);
        String filename =order.getOrder_file().getOriginalFilename();
        order.setNewname(path2+"/"+filename);
        System.out.println(order.getNewname());
        
        try {
        	order.getOrder_file().transferTo(new File(path+"/"+filename));
        }catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return null;
	}	
}