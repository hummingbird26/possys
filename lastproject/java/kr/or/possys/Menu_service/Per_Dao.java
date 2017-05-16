package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.food_service.Food;
@Repository
public class Per_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Menu menuview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.menuview",menu_id);
	}
	

	public int getmenucount(){
		System.out.println("02_Menu_dao.java->>getmenucount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.getmenucount");
	}
	public List<Per> perlist(int currentPage, int pageRow){
		System.out.println("03_per_dao.java->>menulist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Per_Mapper.perlist",map);
	}
	// 검색 요청
	public List<Food> foodsearch(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("07_Food_dao.java->>foodsearch 실행");
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
		
			
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Per_Mapper.foodsearch", map);
	}
	// 검색수 요청
	public int foodSRlist(String selbox,String keyWord){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.foodSRlist",map);
		
	}
}
