package kr.or.possys.food_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Food_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//food �Է¿�û
	public int insertfood(Food food){
		System.out.println("01_Food_dao.java->>insertfood ���� ");	
		return sqlSessionTemplate.insert("kr.or.possys.food_service.Food_Mapper.insertfood",food);
	}
	//food ��� ���� ī��Ʈ
	public int getfoodcount(){
		System.out.println("02_Food_dao.java->>getfoodcount ���� ");
		return sqlSessionTemplate.selectOne("kr.or.possys.food_service.Food_Mapper.getfoodcount");
	}
	//food ��Ͽ�û
	public List<Food> foodlist(int currentPage, int pageRow){
		System.out.println("03_Food_dao.java->>foodlist ����");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.food_service.Food_Mapper.foodlist",map);
	}
}
