
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
import kr.or.possys.Menu_service.Per;
import kr.or.possys.Menu_service.Per_Dao;
import kr.or.possys.food_service.Food;


@Controller
public class Food_Per_Menu_Controller {
	@Autowired
	private Per_Dao dao;
	//메뉴 화면
	@RequestMapping(value="/menu_per_view", method = RequestMethod.GET)
	public String menuperview(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage	){
			int foodcount = dao.getmenucount();
			int pageRow = 10;
			int lastPage = (int)(Math.ceil((double)foodcount/(double)pageRow));
			List<Per> list = dao.perlist(currentPage, pageRow);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("foodcount", foodcount);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			return "/zeus/menu_per_view";
	}
	//메뉴 검색
	@RequestMapping(value="/menu_searchz", method = RequestMethod.GET)
	public String menuSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord){
			
		int menuSRcount = dao.foodSRlist(selbox,keyWord);
		int pageRow = 10;
		int lastPage = (int)(Math.ceil((double)menuSRcount/(double)pageRow));
		List<Food> list = dao.foodsearch(selbox, keyWord, currentPage, pageRow);
			
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("menucount", menuSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
				
		return "/zeus/menu_per_view";
	
	}
	
}