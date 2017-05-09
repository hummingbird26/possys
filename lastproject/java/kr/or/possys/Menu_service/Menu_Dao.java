package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class Menu_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//menu 입력요청
	public int insertmenu(Menu menu){
		System.out.println("menu_Controll.java <-- 실행확인 ");	
		return sqlSessionTemplate.insert("kr.or.possys.Menu_service.Menu_Mapper.insertmenu",menu);
	}
	//menu 리스트 요청
	public int getmenucount(){
		System.out.println("02_Menu_dao.java->>getmenucount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.getmenucount");
	}
	public List<Menu> menulist(int currentPage, int pageRow){
		System.out.println("03_menu_dao.java->>menulist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Menu_Mapper.menulist",map);
	}
	//menu 수정폼 요청
	public Menu menuview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuview",menu_id);
	}
	//menu 수정액션 요청
	public int menumodify(Menu menu){
		System.out.println("05_Menu_dao.java->>menumodify 실행");
		return sqlSessionTemplate.update("kr.or.possys.Menu_service.Menu_Mapper.menumodify",menu);
			
		}
	
}
