package kr.or.possys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Template {
	//메뉴판매 현황 화면 이동
	@RequestMapping(value="/new_member_list")
	public String new_member_list(){
		return "/test_index/handsontable";
	}
	
	//메뉴판매 현황 화면 이동
	@RequestMapping(value="/menu_chart")
	public String menu_chart(){
		return "/test_index/morris";
	}
	
	//직원 통계 화면 이동
	@RequestMapping(value="/staff_chart")
	public String staff_chart(){
		return "/test_index/flot";
	}
	
	//매출현황 화면 이동
	@RequestMapping(value="/chartjs")
	public String Chart_go(){
		return "/test_index/chartjs";
	}
	
	//새로운 탬플릿 달력 화면 이동
		@RequestMapping(value="/Calendar")
		public String Calendar(){
			return "/test_index/calendar";
		}
	//새로운 탬플릿 메인화면 이동
	@RequestMapping(value="/test_index/index")
	public String main(){
		return "/test_index/index";
	}
	
	
}
