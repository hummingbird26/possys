package kr.or.possys.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;

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
		System.out.println("��������Ʈ ��û");
		List<Order> list = odao.order_list();
		model.addAttribute("order_list", list);
		return "/order/order_list";
	}
	

	
	@RequestMapping(value="/order_detail", method = RequestMethod.GET)
	public String order_detail(Model model,@RequestParam(value="table_order_id") String table_order_id){
		System.out.println("�ֹ��� ��û");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_detail";
	}
	
	@RequestMapping(value="/order_end_t", method = RequestMethod.GET)
	public String order_end_t(Model model,@RequestParam(value="table_order_id") String table_order_id){

		System.out.println("�ֹ�ó��");
		List<Order> list = odao.order_detail(table_order_id);
		List<Order> list2;
		List<Order> list3;

		/*odao.order_end_t(table_order_id);*/
		for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).getMenu_id()+"//"+list.get(i).getOrder_detail_ea()+"//"+list.get(i).getOrder_detail_end());
		}

		for (int i = 0; i < list.size(); i++){
			if(list.get(i).getOrder_detail_end().equals("F")){
			odao.order_detail_end_t(list.get(i));
			list2 = odao.order_fpm(list.get(i).getMenu_id());
			if(list2.size() != 0){
				System.out.println("����Ʈ����� 0�� �ƴմϴ�.");
				for(int j = 0; j< list2.size(); j++){
					list3 = odao.order_ep_order(list2.get(j).getFood_id());
					System.out.println(list2.get(j).getFood_id()+"//Ǫ����̵�");
/*					System.out.println(list2.get(j).getFpm_ea()+"//�Һ񰳼�"+"//"+list.get(i).getOrder_detail_ea()+"//�ֹ�����");*/
					int total_use = Integer.parseInt(list.get(i).getOrder_detail_ea()) * Integer.parseInt(list2.get(j).getFpm_ea());
					System.out.println("�ѼҺ񰹼� : "+total_use);
					
					
					if(list3.size() != 0){
						for(int k = 0; k< list3.size(); k++){
							System.out.println(list3.get(k).getFood_nowquantity()+"//������Ȳ//"+list3.get(k).getEp_order_id());
							int food_now = Integer.parseInt(list3.get(k).getFood_nowquantity());
							int food_sum = food_now - total_use;
							if(food_now != 0 && food_sum > 0&&total_use > 0){
								list3.get(k).setFood_sum(food_sum);
								odao.order_ep_plus(list3.get(k));
								total_use = 0;
								System.out.println("���� - ��Ȳ > 0"+food_sum);
								
							}
							else if (food_now != 0 && food_sum <= 0 &&total_use > 0){
								System.out.println("���� - ��Ȳ <= 0");
								total_use -= food_now; 
								System.out.println("����Һ�"+total_use);
								odao.order_ep_zero(list3.get(k));
							}
						}
						
						if(total_use != 0){
							System.out.println("���簡 �������� �ʾ�?");
						}
					}
				}
			}
			}
		}
		
		
		return "redirect:/order_list";
	}
	
	@RequestMapping(value="/order_modify_action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_modify_action(Order order){
		System.out.println("����ó��");
		
		/*List<Order> list = new ArrayList<Order>();*/
		
		odao.order_detail_delete(order.getTable_order_id());
		if(order.getMenu_id() != null){
		String [] menu_id = order.getMenu_id().split(",");
		String [] menu_name = order.getMenu_name().split(",");
		String [] order_detail_ea = order.getOrder_detail_ea().split(",");
		String [] order_detail_sum = order.getOrder_detail_sum().split(",");
		String [] order_detail_end = order.getOrder_detail_end().split(",");
		
		
		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			order2.setOrder_detail_end(order_detail_end[i]);
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
		System.out.println("�ֹ������� ��û");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		for(int i = 0; i< list.size(); i++){
			String menu_id = list.get(i).getMenu_id();
			String menu_price =odao.get_price(menu_id);
			list.get(i).setMenu_price(menu_price);
			System.out.println(list.get(i).getMenu_price()+"����");
		}
		//�޴���Ͻ���
		List<Menu> menu_list = odao.menu_list();

		model.addAttribute("menu_list", menu_list);
		//�޴���ϳ�
		
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_modify_form";
		
	}

	@RequestMapping(value="/order_form", method = RequestMethod.GET)
	public String order_form(Model model){
		System.out.println("ī��Ʈ����");
		Order order_c = odao.order_count();
		String count = order_c.getOrder_count();
		int counter = Integer.parseInt(count.substring(1, 5))+1;
		String result_id = "t"+String.format("%04d", counter);
		System.out.println(result_id);
		
		List<Menu> menu_list = odao.menu_list();
		model.addAttribute("result_id",result_id);
		model.addAttribute("menu_list", menu_list);
		
		
		
		
		

		return "/order/order_form";
	}
	
	@RequestMapping(value="/order_action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_action(Order order){
		
		if(order.getMenu_id() != null){
		String [] menu_id = order.getMenu_id().split(",");
		String [] menu_name = order.getMenu_name().split(",");
		String [] order_detail_ea = order.getOrder_detail_ea().split(",");
		String [] order_detail_sum = order.getOrder_detail_sum().split(",");
		odao.order_insert(order);
		
		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setResult_id(order.getResult_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			order2.setOrder_detail_end("F");
			odao.order_detail_insert(order2);
			
			System.out.println(order2.getMenu_id());
		}
		
		}
		
		return "redirect:/order_list";
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