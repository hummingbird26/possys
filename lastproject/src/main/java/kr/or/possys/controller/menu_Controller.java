package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Menu_service.Menu;

import kr.or.possys.Menu_service.Menu_Dao;
import kr.or.possys.food_service.Food;


@Controller
public class menu_Controller {
	@Autowired
	private Menu_Dao dao;
	
	@RequestMapping(value="/menu_add_form", method = RequestMethod.GET)
	public String menuadd(){
		return "/zeus/menu_add_form";
	}
	@RequestMapping(value="/menu_add_form", method = RequestMethod.POST)
	public String menuadd(Menu menu){
		System.out.println("02_menuController.java ->>menuadd 액션 요청");
		dao.insertmenu(menu);
		return "redirect:/menu_list";
	}
}
