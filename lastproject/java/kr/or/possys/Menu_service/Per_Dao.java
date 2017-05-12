package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Per_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertmenu(Per per){
		System.out.println("per_Controll.java <-- 실행확인 ");	
		return sqlSessionTemplate.insert("kr.or.possys.Menu_service.Per_Mapper.insertmenu",per);
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
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Per_Mapper.menulist",map);
	}
}
