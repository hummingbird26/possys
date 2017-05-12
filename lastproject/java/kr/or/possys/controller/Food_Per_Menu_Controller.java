
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


@Controller
public class Food_Per_Menu_Controller {
	@Autowired
	private Per_Dao dao;
	//메뉴 화면
	@RequestMapping(value="/1menu_add_form", method = RequestMethod.GET)
	public String menuadd(){
		return "/zeus/menu_add_form";
	}
	//메뉴 목록
	@RequestMapping(value="/1menu_add_form", method = RequestMethod.POST)
	public String menuadd(Per per){
		System.out.println("02_menuController.java ->>menuadd 액션 요청");
		dao.insertmenu(per);
		return "redirect:/menu_per_view";
	}
	@RequestMapping(value="/1menu_per_view", method = RequestMethod.GET)
	public String menulist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("menuController.java ->>menulist 요청");
		int foodcount = dao.getmenucount();
		int pageRow = 10;
		int lastPage = (int)(Math.ceil((double)foodcount/(double)pageRow));
		List<Per> list = dao.perlist(currentPage, pageRow);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "/zeus/menu_per_view";
	}
}