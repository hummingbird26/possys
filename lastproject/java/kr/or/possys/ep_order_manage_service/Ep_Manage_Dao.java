package kr.or.possys.ep_order_manage_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.food_service.Food;

@Repository
public class Ep_Manage_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//업체 입력요청
	public int insertep_m(Ep_Manage ep_m){
		System.out.println("01_Ep_Manage_Dao.java->>insertep_m 실행 ");	
		return sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
	}
	//업체 목록 갯수 카운트
	public int getep_mcount(){
		System.out.println("02_Ep_Manage_Dao.java->>getep_mcount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.getep_mcount");
	}
	//업체 목록요청
	public List<Ep_Manage> ep_mlist(int currentPage, int pageRow){
		System.out.println("03_Ep_Manage_Dao->>ep_mlist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mlist",map);
	}
	//업체 수정폼 요청
	public Ep_Manage ep_mview(String ep_id){
		System.out.println("04_Ep_Manage_Dao.java->>ep_mview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mview",ep_id);
	}
	//###업체 입력폼 요청

	public Food ep_mchck(String food_id){
		System.out.println(food_id+"<==== dao list");
		
		
			
		return  sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_chkadd",food_id);
			 
		
		
	}
	//업체 수정액션 요청
	public int ep_mmodify(Ep_Manage ep_m){
		System.out.println("05_Ep_Manage_Dao->>ep_mmodify 실행");
		System.out.println(ep_m.getEp_id());
		return sqlSessionTemplate.update("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mmodify",ep_m);
		
	}
	//food 삭제 요청
	public int ep_mdelete(String ep_id){
		System.out.println("06_Ep_Manage_Dao->>ep_mdelete 실행");
		return sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mdelete",ep_id);
	}
	//food 검색 요청
	public List<Ep_Manage> ep_msearch(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("07_Ep_Manage_Dao->>ep_msearch 실행");
		System.out.println(selbox);
		System.out.println(keyWord);
		System.out.println(currentPage);
		System.out.println(pageRow);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		System.out.println(map.get("beginRow"));
		System.out.println(map.get("pageRow"));
		
			
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_msearch", map);
	}
	//food 검색 수 요청
	public int ep_mSRlist(String selbox,String keyWord){
		System.out.println("08_Ep_Manage_Dao.java->>ep_mSRlist 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mSRlist",map);
		
	}
}
