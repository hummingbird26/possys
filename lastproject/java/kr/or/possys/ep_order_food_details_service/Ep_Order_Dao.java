package kr.or.possys.ep_order_food_details_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Ep_Order_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// ajax// ���� �ֹ���Ͽ��� �񵿱� �԰��� ��
	public List<Ep_Order> js_ep_wh_list(String ep_order_id){
		System.out.println("AJAX_01_ ep_wh_list ���� - Ep_Order_Dao.java");	
		System.out.println(ep_order_id+"<=== ep_order_id");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.js_ep_wh_list",ep_order_id);
	}
	
	// ���� �ֹ� ��� ��û �ߺ�����
	public List<Ep_Order> ep_o_list(){
		System.out.println("07_ep_o_list ���� - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_list");
	}
	// ���� �ֹ� ��� �ߺ� ���� count ����
	public int ep_o_count(){
		System.out.println("06_ep_o_count ���� - Ep_Order_Dao.java");		
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_count");
	}
	
	// ���ֵ�� default �� Ȯ�� update ����
	public void default_up(Ep_Order ep_o){
		System.out.println("_05_01_default_up���� - Ep_Order_Dao.java");
//		System.out.println(ep_o.getEp_id());
//		System.out.println(ep_o.getEp_order_ea());
//		System.out.println(ep_o.getFood_id());
		sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.default_up",ep_o);
	}
	
	// ���ֵ�Ͻ� default Ȯ���ϱ� ���� select one
	public Ep_Order _ep_oinsert(Ep_Order _ep_o){
		System.out.println("_05_ep_oinsert���� - Ep_Order_Dao.java");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("food_id", _ep_o.getFood_id());
		map.put("ep_id", _ep_o.getEp_id());
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper._ep_oinsert",map);
	}	
	// ���ֵ�� insert 
	public void ep_oinsert(Ep_Order ep_o){
		System.out.println("05_ep_oinsert���� - Ep_Order_Dao.java");
		sqlSessionTemplate.insert("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_oinsert",ep_o);
//		String ep_id = ep_o.getEp_id();
//		String food_id = ep_o.getFood_id();
//		int ep_order_ea = ep_o.getEp_order_ea();
//		System.out.println(ep_id+" <===ep_id");
//		System.out.println(food_id+" <===food_id");
//		System.out.println(ep_order_ea+" <===ep_order_ea");
		
	}
	
	// ��������Ȳ �ߺ����� ��ü count ��û
	public int ep_ocount(){
		System.out.println("01_ep_ocount()���� - Ep_Oder_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_ocount");
	}
	// ��������Ȳ ��� ��û
	public List<Ep_Order> ep_olist(){
		System.out.println("02_ep_olist ���� ->> Ep_Oder_Dao.java");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_olist");
	}
	//��������Ȳ �˻� ��� ��û
	public List<Ep_Order> food_DT_SRlist(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("03_Ep_Order_Dao.java->>food_DT_search ����");
//		System.out.println(selbox);
//		System.out.println(keyWord);
//		System.out.println(currentPage);
//		System.out.println(pageRow);
		Map<String, Object> map = new HashMap<String, Object>();
		String plus = "food_manage";
		String plus2 = "ep_order_food_details";
		if(selbox.equals("food_name")){
			map.put("plus", plus);
		}else{map.put("plus", plus2);}
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
//		System.out.println(map.get("selbox"));
//		System.out.println(map.get("keyWord"));
//		System.out.println(map.get("beginRow"));
//		System.out.println(map.get("pageRow"));
//		
			
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.food_DT_SRlist", map);
	}
	//��������Ȳ �˻� �� ��û
	public int food_DT_SRcount(String selbox,String keyWord){
		System.out.println("04_food_DT_SRlist���� - Ep_Order_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		String plus = "food_manage";
		String plus2 = "ep_order_food_details";
		if(selbox.equals("food_name")){
			map.put("plus", plus);
		}else{map.put("plus", plus2);}
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.food_DT_SRcount",map);
		
	}
}
