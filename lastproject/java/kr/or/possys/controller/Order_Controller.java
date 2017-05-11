package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;



@Controller
public class Order_Controller {
	@Autowired
	private Order_Dao odao;

	@RequestMapping(value="/order_list", method = RequestMethod.GET)
	public String order_list(Model model){
		System.out.println("오더리스트 요청");
		List<Order> list = odao.order_list();
		model.addAttribute("list", list);
		return "/order/order_list";
	}
	
	@RequestMapping(value="/order_modify_form", method = RequestMethod.GET)
	public String order_modify_form(Model model,@RequestParam(value="table_order_id") String table_order_id){
		System.out.println("주문수정폼 요청");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		model.addAttribute("order",order);
		model.addAttribute("list",list);
		return "/order/order_modify_form";
	}
}
