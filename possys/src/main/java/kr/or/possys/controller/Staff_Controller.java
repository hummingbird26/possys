package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;

@Controller
public class Staff_Controller {
	
	@Autowired
	private Staff_Dao sdao;
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "home";
	}*/
	
	@RequestMapping(value="/tori/staff/staff_add_form", method = RequestMethod.GET)
	public String staffadd(){
		System.out.println("01 Staff_Controller.java -> staffadd");
		return "/tori/staff/staff_add_form";
	}
	
	@RequestMapping(value="/tori/staff/staff_add_action", method = RequestMethod.POST)
	public String staffadd(Staff Staff){
		System.out.println("01_1 Staff_Controller.java -> paymentadd");
		
		String id = Staff.getStaff_id();
		System.out.println(id+"<------- ��Ʈ�ѷ� ���� Ȯ���Ѵ�.");
		
		sdao.insertStaff(Staff);
		return "redirect:/tori/staff/staff_list";
	}
	
	@RequestMapping(value={"/tori/staff/staff_list"}, method = RequestMethod.GET)
	public String stafflist(Model model, @RequestParam(value="currentpage", required=false, defaultValue="1") int currentPage){
		System.out.println("02_Staff_Controller.java -> stafflist");
		int staffcount = sdao.getStaffCount();
		System.out.println("02_1 Staff_Controller.java -> stafflist");
		int pagePerRow = 10;
		int lastPage = (int)(Math.ceil((double)staffcount/(double)pagePerRow));
		List<Staff> list = sdao.getStaffList(currentPage, pagePerRow);
		System.out.println(staffcount);
		System.out.println(Math.ceil(staffcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
		
		model.addAttribute("staffcount",staffcount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("staffcount",staffcount);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("list",list);
		
		return "/tori/staff/staff_list";
		
	}
	
	//����Ʈ���� ��� �Ѿ��
		@RequestMapping(value={"/tori/staff/staff_view"}, method = RequestMethod.GET)
		public String stafftview(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			System.out.println("03_Payment_Controller.java -> paymentview");
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_view";
		}
		
	//�������� �̵��Ѵ�
		@RequestMapping(value={"/tori/staff/staff_update_form"}, method = RequestMethod.GET)
		public String staffupdate(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_update_form";
		}
	//���������� �����׼� ����
		@RequestMapping(value={"/tori/staff/staff_update_action"}, method = RequestMethod.POST)
		public String staffupdate(Staff staff){
			sdao.updateStaff(staff);
			return "redirect:/tori/staff/staff_list";
		}
	
	//���������� �̵��Ѵ�
		@RequestMapping(value={"/tori/staff/staff_delete_form"}, method = RequestMethod.GET)
		public String staffdelete(Model model, @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff", staff);
			return "/tori/staff/staff_delete_form";
		}
	
	//��������
		@RequestMapping(value={"/tori/staff/staff_delete_action"}, method = RequestMethod.POST)
		public String staffdelete(@RequestParam(value="staff_id",required=true) String staff_id,
								@RequestParam(value="staff_pw",required=true) String staff_pw){
			sdao.deleteStaff(staff_id, staff_pw);
			return "redirect:/tori/staff/staff_list";
		}
}
