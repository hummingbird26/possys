package kr.or.possys.Order_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<Order> order_detail(String table_order_id){
		System.out.println("주문상세실행");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_detail",table_order_id);
	}

}
