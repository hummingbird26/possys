package kr.or.possys.Order_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Menu_service.Menu;
import kr.or.possys.food_service.Food;

@Repository
public class Order_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate2;
	
	public List<Order> order_list(){
		System.out.println("OrderList실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_list");	
	}
	
	public Order order_modify_form(String table_order_id){
		System.out.println("주문수정폼실행");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_modify_form",table_order_id);
	}
	
	public String get_price(String menu_id){
		System.out.println("가격가져오기");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.get_price",menu_id);
	}
	
	public List<Order> order_detail(String table_order_id){
		System.out.println("주문상세실행");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_detail",table_order_id);
	}
	
	public int order_end_t(String table_order_id){
		System.out.println("주문종결실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_end_t",table_order_id);
	}
	
	public int order_detail_end_t(Order order){
		System.out.println("주문종결실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_end_t",order);
	}
	
	public int order_detail_modify(Order order){
		System.out.println("주문상세실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_modify",order);
	}
	
	public int order_detail_delete(String table_ordere_id){
		System.out.println("주문삭제실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_detail_delete",table_ordere_id);
	}
	
	public int order_detail_insert(Order order){
		System.out.println("주문상세입력실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_insert",order);
	}
	
	public List<Menu> menu_list(){
		System.out.println("메뉴목록실행");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.menu_list");
	}
	
	public List<Order> order_fpm(String menu_id){
		System.out.println("Order_fpm실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_fpm",menu_id);	
	}
	
	public List<Order> order_ep_order(String food_id){
		System.out.println("Order_ep_order실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_ep_order",food_id);	
	}
	
	public int order_ep_zero(Order order){
		System.out.println("식재 0개실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_ep_zero",order);
	}
	
	public int order_ep_plus(Order order){
		System.out.println("식재 소비실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_ep_plus",order);
	}
	
	public Order order_count(){
		System.out.println("getcount");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_count");
	}
	
	
	

}