package kr.or.possys.food_service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Food_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//food 입력요청
	public int insertfood(Food food){
		System.out.println("03_insertfood 실행 Food_dao.java");	
		return sqlSessionTemplate.insert("kr.or.possys.food_service.Food_Mapper.insertfood",food);
	}
}
