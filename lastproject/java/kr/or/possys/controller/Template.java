package kr.or.possys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Template {
	//�޴��Ǹ� ��Ȳ ȭ�� �̵�
	@RequestMapping(value="/new_member_list")
	public String new_member_list(){
		return "/test_index/handsontable";
	}
	
	//�޴��Ǹ� ��Ȳ ȭ�� �̵�
	@RequestMapping(value="/menu_chart")
	public String menu_chart(){
		return "/test_index/morris";
	}
	
	//���� ��� ȭ�� �̵�
	@RequestMapping(value="/staff_chart")
	public String staff_chart(){
		return "/test_index/flot";
	}
	
	//������Ȳ ȭ�� �̵�
	@RequestMapping(value="/chartjs")
	public String Chart_go(){
		return "/test_index/chartjs";
	}
	
	//���ο� ���ø� �޷� ȭ�� �̵�
		@RequestMapping(value="/Calendar")
		public String Calendar(){
			return "/test_index/calendar";
		}
	//���ο� ���ø� ����ȭ�� �̵�
	@RequestMapping(value="/test_index/index")
	public String main(){
		return "/test_index/index";
	}
	
	
}
