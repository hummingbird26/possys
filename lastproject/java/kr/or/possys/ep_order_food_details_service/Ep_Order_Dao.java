package kr.or.possys.ep_order_food_details_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.food_service.Food;

@Repository
public class Ep_Order_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 발주등록 insert 
	public void ep_oinset(Ep_Order ep_o){
		String ep_id = ep_o.getEp_id();
		String food_id = ep_o.getFood_id();
		int ep_order_ea = ep_o.getEp_order_ea();
		System.out.println(ep_id+" <===ep_id");
		System.out.println(food_id+" <===food_id");
		System.out.println(ep_order_ea+" <===ep_order_ea");
		
	}
	
	// 식재자현황 중복없이 전체 count 요청
	public int ep_ocount(){
		System.out.println("01_ep_ocount()실행 - Ep_Oder_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_ocount");
	}
	// 식재자현황 목록 요청
	public List<Ep_Order> ep_olist(int currentPage, int pageRow){
		System.out.println("02_ep_olist 싱행 ->> Ep_Oder_Dao.java");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_olist",map);
	}
	//식자재현황 검색 목록 요청
	public List<Ep_Order> food_DT_SRlist(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("03_Ep_Order_Dao.java->>food_DT_search 실행");
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
	//식재자현황 검색 수 요청
	public int food_DT_SRcount(String selbox,String keyWord){
		System.out.println("04_food_DT_SRlist실행 - Ep_Order_Dao.java");
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
