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
import kr.or.possys.ep_order_food_details_service.Food_Present_Sangse_VO;
import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.ep_order_manage_service.Ep_Manage_Dao;



@Controller
@RequestMapping("/ajax")
public class Ajax_Ep_Controller {
	@Autowired
	private Ep_Manage_Dao ep_mdao;
	@Autowired
	private Ep_Order_Dao ep_odao; //dao를 추가할라면 @Autowired를 선언해야한다.
	
	// 상세보기 폼 화면 table 관련
	@RequestMapping(value="/aj_sangse_table")
	@ResponseBody
		public Food_Present_Sangse_VO aj_sangse_table(@RequestParam(value="food_id", required=true) String food_id
												,HttpServletResponse response) throws Exception {
		System.out.println(food_id+"<== food_id - 09_aj_sangse_table실행 -Ep_OF_Details_Controller.java");
		Food_Present_Sangse_VO sangse_vo = ep_odao.aj_sangse_table(food_id);
		return sangse_vo;		
	}
	
	// 상세보기 폼 화면 span 관련
	@RequestMapping(value="/aj_sangse_span")
	@ResponseBody
		public Food_Present_Sangse_VO aj_sangse_span(@RequestParam(value="food_id", required=true) String food_id
												,HttpServletResponse response) throws Exception {
		System.out.println(food_id+"<== food_id - 08_aj_sangse_span실행 -Ep_OF_Details_Controller.java");
		Food_Present_Sangse_VO sangse_vo = ep_odao.aj_sangse_span(food_id);
		return sangse_vo;		
	}
	
	
	// 상세보기에서 발주취소 
	@RequestMapping(value="/aj_sangse_cancel")
	@ResponseBody
		public void aj_sangse_cancel(@RequestParam(value="ep_order_id", required=true) String ep_order_id
												,HttpServletResponse response) throws Exception {
		System.out.println(ep_order_id+"<== ep_order_id - 07_aj_sangse_cancel실행 -Ep_OF_Details_Controller.java");
		ep_odao.aj_sangse_cancel(ep_order_id);
	}
	
	//발주 주문목록 상세보기 폼에서 해당 식재 발주 취소시 DB 의 해당 발주주문이 삭제처리
	@RequestMapping(value="/select_del")
	@ResponseBody
		public void aj_select_del(@RequestParam(value="o_del", required=true) String o_del
												,HttpServletResponse response) throws Exception {
			System.out.println("06_ep_chck실행 -Ep_OF_Details_Controller.java" );
			System.out.println(o_del+"<=== 발주코드/식재코드!");
			String[] split = o_del.split("/");
//			System.out.println(split[0]+"<<< ep_order_id");
//			System.out.println(split[1]+"<<< food_id");
			String ep_order_id = split[0];
			String food_id = split[1];
			ep_odao.aj_select_del(ep_order_id, food_id);
//			int chk_count = ep_mdao.aj_ep_chck(food_id);			
				
		}	
	// 발주 등록시 식재료가 업체에 등록되었는지 확인 체크
	@RequestMapping(value="/ep_chck")
	@ResponseBody
		public int ep_chck(@RequestParam(value="food_id", required=true) String food_id
												,HttpServletResponse response) throws Exception {
			System.out.println("06_ep_chck실행 -Ep_OF_Details_Controller.java" );
			System.out.println(food_id+"<=== 식재코드!");
			int chk_count = ep_odao.aj_ep_chck(food_id);			
			return chk_count;	
		}	
	//발주 주문리스트 입고등록 폼 요청 AJAX
	@RequestMapping(value="/ep_wh_add_form")
	@ResponseBody
		public List<Ep_Order> ep_wh_add_form(@RequestParam(value="ep_order_id", required=true) String ep_order_id
												,HttpServletResponse response) throws Exception {
			System.out.println("05_ep_wh_add_form실행 -Ep_OF_Details_Controller.java" );
			System.out.println(ep_order_id+"<=== 발주코드!");
			List<Ep_Order> ep_wh_list = new ArrayList<Ep_Order>();
			ep_wh_list = ep_odao.js_ep_wh_list(ep_order_id);
				
				// [첫번째 시도] 클래스 배열 처리로 ep_order_id 가져오기 (비효율)
//				List<List<Ep_Order>> _ep_wh_list = new ArrayList<List<Ep_Order>>();
//				for(String ep_order_id : wh_bt){
//					System.out.println(ep_order_id+"<<< ep_order_id");
//					ep_wh_list = ep_odao.js_ep_wh_list(ep_order_id);
//					_ep_wh_list.add(ep_wh_list);
//				}				
//				 for(int i=0; i<_ep_wh_list.size(); i++){ //1차원배열의 크기
//					 for(int j=0; j<_ep_wh_list.get(i).size(); j++){ // 2차원에 담긴 배열의 크기
//						System.out.println("("+i+","+j+")="+_ep_wh_list.get(i).get(j)); 
//					 }//2차원 배열로 리스트 받음
//				 }
//				System.out.println(ep_wh_list+"<<<< ep_wh_list");
				// [첫번째 시도] END

//				model.addAttribute("ep_wh_list",ep_wh_list);
// 				jstl 로 뿌리고 싶다면 model 객체에 담아야한다.
				return ep_wh_list;
			}
	
	//select box 에서 업체명 선택시 해당 업체명의 정보를 호출
	@RequestMapping(value="/sel_ep")
	@ResponseBody
	public Ep_Manage sel_ep(@RequestParam(required=true) String ep_id
											,HttpServletResponse response) throws Exception {
			System.out.println(ep_id+"<----ep_id 01_ajax/sel_ep - sel_ep() 실행");
			Ep_Manage ep_m = ep_mdao.ep_mview(ep_id);
			System.out.println(ep_m+"<-=");
		return ep_m;
	}
	// 식재료코드 와 업체코드 중복검사
	@ResponseBody
	@RequestMapping(value="/food_chck")
	public List<String> food_chck(@RequestParam(value="arr", required=true) String[] arr
										,HttpServletResponse response) throws Exception {
			System.out.println(arr+"<----arr 02_ajax/food_chck - food_chck() 실행");
			String re = null; // return 변수 만듦
			List<String> ep_list = new ArrayList<String>();
			for(String ar : arr){
				System.out.println(ar);				
				int count = ep_mdao.aj_food_chck(ar);
				System.out.println(count);
					if(count == 0){
						System.out.println(count+"<--ep_id 없음");
						re = "N";
						
					}else if(count >= 1){
						System.out.println(count+"<--ep_id 있음");
						re = ar;
						System.out.println(re+"<--ep_id");
						
					}
					ep_list.add(re);
				}
		return ep_list;
	}
}
