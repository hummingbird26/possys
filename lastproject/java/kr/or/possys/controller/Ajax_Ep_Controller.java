package kr.or.possys.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.ep_order_manage_service.Ep_Manage_Dao;



@Controller
@RequestMapping("/ajax")
public class Ajax_Ep_Controller {
	@Autowired
	private Ep_Manage_Dao dao; 
	@RequestMapping(value="/sel_ep")
	@ResponseBody
	public Ep_Manage sel_ep(@RequestParam(required=true) String ep_id
											,HttpServletResponse response) throws Exception {
						
			System.out.println(ep_id+"<----ep_name 01_ajax/sel_ep - sel_ep() ½ÇÇà");
			Ep_Manage ep_m = dao.ep_mview(ep_id);
			System.out.println(ep_m+"<-=");
		return ep_m;
	}
	@RequestMapping(value="/food_chck")
	public int food_chck(@RequestParam(required=true) String d
										,HttpServletResponse response) throws Exception {
		
		return 0;
		
	}
}
