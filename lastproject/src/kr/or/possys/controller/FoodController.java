package kr.or.possys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.possys.food_service.Food;
import kr.or.possys.food_service.Food_Dao;

@Controller
public class FoodController {
	@Autowired
	private Food_Dao dao;
	//식재료 입력폼 요청
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "home";
	}
	@RequestMapping(value="/food_add_form", method = RequestMethod.GET)
	public String foodadd(){
		System.out.println("01_foodadd 폼 요청");
		return "/wonbin/food_add_form";
	}
	@RequestMapping(value="/food_add_form", method = RequestMethod.POST)
	public String foodadd(Food food){
		System.out.println("02_foodadd 액션 요청");
		dao.insertfood(food);
		
		return null;
			}
	
}
