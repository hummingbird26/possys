package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.food_service.Food;
import kr.or.possys.food_service.Food_Dao;

@Controller
public class FoodController {
	@Autowired
	private Food_Dao dao;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "home";
	}
	//����� �Է��� ��û
	@RequestMapping(value="/food_add_form", method = RequestMethod.GET)
	public String foodadd(){
		System.out.println("01_FoodController.java ->>foodadd �� ��û");
		return "/wonbin/food_add_form";
	}
	//����� �Է¾׼� ��û
	@RequestMapping(value="/food_add_form", method = RequestMethod.POST)
	public String foodadd(Food food){
		System.out.println("02_FoodController.java ->>foodadd �׼� ��û");
		dao.insertfood(food);
		return "redirect:/food_list";
	}
	//����� ��� ��û
	@RequestMapping(value="/food_list", method = RequestMethod.GET)
	public String foodlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("FoodController.java ->>foodlist ��û");
		int foodcount = dao.getfoodcount();
		int pageRow = 20;
		int lastPage = (int)(Math.ceil(foodcount/pageRow));
		List<Food> list = dao.foodlist(currentPage, pageRow);
		System.out.println(foodcount);
		System.out.println(Math.ceil(foodcount/pageRow));
		System.out.println(lastPage);
		
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "/wonbin/food_list";
	}
}
