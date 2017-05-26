package kr.or.possys.controller;

import java.util.ArrayList;

import java.util.List;



import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import kr.or.possys.ep_order_food_details_service.Ep_Order;
import kr.or.possys.ep_order_food_details_service.Ep_Order_Dao;
import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.ep_order_manage_service.Ep_Manage_Dao;



@Controller
@RequestMapping("/ajax")
public class Ajax_Ep_Controller {
	@Autowired
	private Ep_Manage_Dao ep_mdao;

						// ���� Ÿ dao�� ȣ���� ����//
	//	private Ep_Order_Dao ep_odao; // private �� dao�� �ϳ� �߰��ϴ� ��Ʈ�ѷ����� dao�� ������ ������.
	//���� �ֹ�����Ʈ �԰��� �� ��û
//	@RequestMapping(value="/ep_wh_add_form")
//	@ResponseBody
//	public List<Ep_Order> ep_wh_add_form(@RequestParam(value="ep_order_id", required=true) String ep_order_id
//										,HttpServletResponse response) throws Exception {
//		System.out.println("05_ep_wh_add_form���� -Ep_OF_Details_Controller.java" );
//		System.out.println(ep_order_id+"<=== �����ڵ�!");
////		List<Ep_Order> ep_wh_list = new ArrayList<Ep_Order>();
//		Ep_Order_Dao ep_odao2 = new Ep_Order_Dao(); //
////		List<Ep_Order> ep_wh_list = 
//		ep_odao2.js_ep_wh_list(ep_order_id);	
////		System.out.println(ep_wh_list+"<<<< ep_wh_list");
//		return null;
//	}
						// Ÿ dao�� ȣ���� ����//
	
	//select box ���� ��ü�� ���ý� �ش� ��ü���� ������ ȣ��
	@RequestMapping(value="/sel_ep")
	@ResponseBody
	public Ep_Manage sel_ep(@RequestParam(required=true) String ep_id
											,HttpServletResponse response) throws Exception {
			System.out.println(ep_id+"<----ep_id 01_ajax/sel_ep - sel_ep() ����");
			Ep_Manage ep_m = ep_mdao.ep_mview(ep_id);
			System.out.println(ep_m+"<-=");
		return ep_m;
	}
	// ������ڵ� �� ��ü�ڵ� �ߺ��˻�
	@ResponseBody
	@RequestMapping(value="/food_chck")
	public List<String> food_chck(@RequestParam(value="arr", required=true) String[] arr
										,HttpServletResponse response) throws Exception {
			System.out.println(arr+"<----arr 02_ajax/food_chck - food_chck() ����");
			String re = null; // return ���� ����
			List<String> ep_list = new ArrayList<String>();
			for(String ar : arr){
				System.out.println(ar);				
				int count = ep_mdao.aj_food_chck(ar);
				System.out.println(count);
					if(count == 0){
						System.out.println(count+"<--ep_id ����");
						re = "N";
						
					}else if(count >= 1){
						System.out.println(count+"<--ep_id ����");
						re = ar;
						System.out.println(re+"<--ep_id");
						
					}
					ep_list.add(re);
				}
		return ep_list;
	}
}
