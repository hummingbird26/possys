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
		System.out.println("OrderList����");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_list");	
	}
	
	public Order order_modify_form(String table_order_id){
		System.out.println("�ֹ�����������");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_modify_form",table_order_id);
	}
	
	public String get_price(String menu_id){
		System.out.println("���ݰ�������");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.get_price",menu_id);
	}
	
	public List<Order> order_detail(String table_order_id){
		System.out.println("�ֹ��󼼽���");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_detail",table_order_id);
	}
	
	public int order_end_t(String table_order_id){
		System.out.println("�ֹ��������");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_end_t",table_order_id);
	}
	
	public int order_detail_modify(Order order){
		System.out.println("�ֹ��󼼽���");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_modify",order);
	}
	
	public int order_detail_delete(String table_ordere_id){
		System.out.println("�ֹ���������");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_detail_delete",table_ordere_id);
	}
	
	public int order_detail_insert(Order order){
		System.out.println("�ֹ����Է½���");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_insert",order);
	}

}
