package kr.or.possys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

/*import javax.mail.internet.MimeMessage;*/
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Member_sevice.Member;
import kr.or.possys.Member_sevice.Member_Dao;
import kr.or.possys.Member_sevice.mVo;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import net.sf.json.JSONArray;

@Controller
public class Member_Controller {

	@Autowired
	private	Member_Dao	Mdao;
	
	@Autowired
	private	Order_Dao	odao;
	
	@Autowired
	private Staff_Dao sdao;
	
	//e-mail test
	/*@Autowired*/
	  /*private JavaMailSender mailSender;*/

	//���̺� true,false Ȯ��
	@ResponseBody
	@RequestMapping(value="/table_state")
	public void table_state(HttpServletResponse re) throws IOException{
		System.out.println("table_state �޼��� ���� Ȯ�� Member_Controller.java");
		   re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray table_state = null;
			
			List<Order> state = Mdao.table_state();
			/*if(staff!=null){*/
			
			/*System.out.println(plist);*/
			
			table_state = JSONArray.fromObject(state);
			System.out.println(table_state);
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(table_state.toString());
			
			out.flush();
	}
	
	
	
	// ���̺� ��ġ ȭ������ �̵�
	  @RequestMapping(value = "/table")
	  public String table() {
	   System.out.println("���̺� ��ġ ȭ�� �̵� �޼��� ");
	    return "/member/table";	    
	  } 
	//���̺� �ֹ� ���� Ȯ��
	  @ResponseBody
	  @RequestMapping(value = "/table_order",method = RequestMethod.GET)
	  public void table_order(HttpServletResponse re,@RequestParam(value="table_order_num") String table_order_num) throws IOException{
		  System.out.println("���̺� �ֹ����� Ȯ�� �޼��� Member_Controller.java");
		 
		 re.setCharacterEncoding("UTF-8");
		  
		PrintWriter out = re.getWriter();
		JSONArray order_detail = null;
		
		List<Order> order = Mdao.table_Order_detail(table_order_num);
		/*if(staff!=null){*/
		
		/*System.out.println(plist);*/
		
		order_detail = JSONArray.fromObject(order);
		System.out.println(order_detail);
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(order_detail.toString());
		
		out.flush();
		  
	
	  }
	  
	  // ��й�ȣ ��߱� ȭ�� �̵�
	  @RequestMapping(value = "/repw")
	  public String repw() {
	   System.out.println("��й�ȣ ��߱� ȭ�� �̵� �޼��� ");
	    return "/repw";
	  }  
	// ��й�ȣ ã��  ���̵��  name�� �������� ajax��ſ�
/*	  @ResponseBody
	  @RequestMapping(value = "/idcheck")
	  public void mailForm(HttpServletRequest request,HttpServletResponse re) throws IOException {
		  String checkid = request.getParameter("id");
		  System.out.println(checkid);
		 
		  	re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray CheckStaff = null;
			
			Staff staff = sdao.loginSelect(checkid);
			if(staff!=null){
			
			System.out.println(plist);
			
			CheckStaff = JSONArray.fromObject(staff);
			System.out.println(CheckStaff);
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(CheckStaff.toString());
			
			out.flush();
	   
	  }
	 
	  // ��й�ȣ ã�� �� �ű� pw ��߱� �� db��� ��  �̸��� �߼� �ڵ� 
	
	  @RequestMapping(value="/mail/mailSending",method = RequestMethod.POST)
	  public String mailSending(HttpServletRequest request){
		  System.out.println("���Ϻ�����");
		  			//�Է¹��� email �� id�� ���� ������ ��´�.
		  			String tomail = request.getParameter("email");
		  			String checkid = request.getParameter("id");
		  			System.out.println(checkid);
		  			Staff staff = sdao.loginSelect(checkid);
		  			System.out.println(staff+"<---mailSending �޼��� ���̵� �Է��� ���ϰ� Member_Controller.java");
				    String tomail  = request.getParameter("tomail");     // �޴� ��� �̸���
				    String title   = request.getParameter("title");// ����
					String setfrom = "bsh20057@gmail.com";
					String title = "possys ��й�ȣ ��߱� �ȳ��Դϴ�.";
				    String content ="";
				    String newpw = "";
				    for (int i = 0;i < 5; i++) { 
				        // UUID uuid = UUID.randomUUID() // UUID ��ü�� Object Ÿ�� 
				    	String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -�� ������ �־���. 
				        uuid = uuid.substring(0, 6); //uuid�� �տ������� 10�ڸ� �߶���. 
				        content = "�ű� ��й�ȣ �Դϴ�. �α��� �� ���� ���ּ��� \n"
				        		+ "�ű� ��й�ȣ :"+uuid;
				        newpw = uuid;
				    }
				    
				    
				    //sdao���� ������ ȸ�� ������ �Էµ� email�� ������ �̸��Ͽ� �Է�
				    String tomail = staff.getStaff_email();
				    
				    staff.setStaff_pw(newpw);
				    staff.getStaff_name();
				    staff.getStaff_level();
				    staff.getStaff_age();
				    staff.getStaff_addr();
				    staff.getStaff_gender();
				    staff.getStaff_phone();
				    staff.getStaff_date();
				    staff.getStaff_id();	    
			
				    System.out.println(staff.getStaff_pw()+"<<<<<<<Ȯ��");
				    //�ű� ��й�ȣ�� ������Ʈ
				    sdao.updateStaff(staff);
				   
				     String content = request.getParameter("content");    // ����
				    System.out.println("���ο� ��й�ȣ"+newpw);
				    System.out.println("�޴»�� �̸���"+tomail);
				    System.out.println("�̸��� ����"+title);
				    System.out.println("�̸��� ����"+content);
				    try {
				      MimeMessage message = mailSender.createMimeMessage();
				      
				      MimeMessageHelper messageHelper 
				                        = new MimeMessageHelper(message, true, "UTF-8");
				 
				      messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
				      messageHelper.setTo(tomail);     // �޴»�� �̸���
				      messageHelper.setSubject(title); // ���������� ������ �����ϴ�
				      messageHelper.setText(content);  // ���� ����
				     
				      mailSender.send(message);
				    } catch(Exception e){
				      System.out.println(e);
				    }
					return "redirect:/";
					
			}*/

	  /*}*/
 
	
	
	//�׷��� ��� ȭ�� ȣ�� �޼���
	@RequestMapping(value="/total_payment")
	public String total_payment(){
		return "/member/total_payment";
	}
	//ī����� �޼���(���)
		@RequestMapping(value="/C_CDcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_CDcatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_CDcatePayment �޼��� ���� Ȯ�� Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_CDcatePayment = null;
			
			List<Payment_Cancel> CDcate = Mdao.C_CDcatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_CDcatePayment = JSONArray.fromObject(CDcate);
			System.out.println(C_CDcatePayment);
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(C_CDcatePayment.toString());
			
			out.flush();
		}
		//���ݰ��� �޼���(���)
		@RequestMapping(value="/C_Mcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_McatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_McatePayment �޼��� ���� Ȯ�� Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_McatePayment = null;
			
			List<Payment_Cancel> Mcate = Mdao.C_McatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_McatePayment = JSONArray.fromObject(Mcate);
			System.out.println(C_McatePayment);
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(C_McatePayment.toString());
			
			out.flush();
		}
		//���ո��⳻��(���)
		@RequestMapping(value="/C_graph",method = RequestMethod.GET)
		@ResponseBody
		public void C_totalPayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_totalPayment �޼��� ���� Ȯ�� Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_totalPayment = null;
			
			List<Payment_Cancel> plist = Mdao.C_totalPaymentList(selbox);
			
			/*System.out.println(plist);*/
			
			C_totalPayment = JSONArray.fromObject(plist);
			System.out.println(C_totalPayment);
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(C_totalPayment.toString());
			
			out.flush();
		}
	
	//ī����� �޼���
	@RequestMapping(value="/CDcate",method = RequestMethod.GET)
	@ResponseBody
	public void CDcatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment �޼��� ���� Ȯ�� Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray CDcatePayment = null;
		
		List<Payment> CDcate = Mdao.CDcatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		CDcatePayment = JSONArray.fromObject(CDcate);
		System.out.println(CDcatePayment);
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(CDcatePayment.toString());
		
		out.flush();
	}
	//���ݰ��� �޼���
	@RequestMapping(value="/Mcate",method = RequestMethod.GET)
	@ResponseBody
	public void McatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment �޼��� ���� Ȯ�� Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray McatePayment = null;
		
		List<Payment> Mcate = Mdao.McatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		McatePayment = JSONArray.fromObject(Mcate);
		System.out.println(McatePayment);
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(McatePayment.toString());
		
		out.flush();
	}
	//���ո��⳻��
	@RequestMapping(value="/graph",method = RequestMethod.GET)
	@ResponseBody
	public void totalPayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment �޼��� ���� Ȯ�� Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray PaymentList = null;
		
		List<Payment> plist = Mdao.totalPaymentList(selbox);
		
		/*System.out.println(plist);*/
		
		PaymentList = JSONArray.fromObject(plist);
		System.out.println(PaymentList);
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(PaymentList.toString());
		
		out.flush();
	}
/*	�˶�â ajax �׽�Ʈ
	@RequestMapping(value="/alram_test",method = RequestMethod.GET)
	@ResponseBody
	public void am(HttpServletResponse re) throws IOException{
		System.out.println("am ����");
		//�ѱ�ȭ
		re.setCharacterEncoding("UTF-8");
		//out ��ü ����ϱ� ���� �غ�
		PrintWriter out = re.getWriter();
		JSONArray OrderListJson = null;
		
		List<Order> olist = odao.order_list();
		System.out.println(olist);
		
		OrderListJson = JSONArray.fromObject(olist);
		System.out.println(OrderListJson);
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(OrderListJson.toString());
		
		out.flush();
	
	}
	�˶�â ȣ��
	@RequestMapping(value="/ho.html")
	public String alram(){
		return "t";
	}*/

	//�ǽð� �˻� ȣ��
	@RequestMapping(value="/real_time")
	public String real_time(Model model){	
		int memberCount = Mdao.getMemberCount();
		model.addAttribute("memberCount",memberCount);
		return "/member/real_time";
	}
	
	//�Է°��� �ѱ��� ��� ȸ�� ����Ʈ ���̼� ������� �޾ƿ���
		@RequestMapping(value="/K_real_time", method = RequestMethod.GET)
		@ResponseBody
			public void K_real_time(@RequestParam(value="insert") String insert
						,Model model
						,HttpServletResponse re
						,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
					System.out.println("josn ȣ��Ȯ��");
					//ajax�� �޾ƿ� �Ű����� �Է°�
					System.out.println(insert+"�Է°�");
					//�ѱ�ȭ
					URLEncoder.encode(insert , "UTF-8");
					re.setCharacterEncoding("UTF-8");
					//out ��ü ����ϱ� ���� �غ�
					PrintWriter out = re.getWriter();
					int pagePerRow = 100;
			
					//json��� ���
					JSONArray memberListJson = null;
					//����Ʈ ���� ȣ��
					List<Member> list = Mdao.K_AjaxMemberList(currentPage, pagePerRow, insert);
					//�޾ƿ� ����Ʈ ���� ���̼� ��ü�� �־��� 
					memberListJson = JSONArray.fromObject(list);
					System.out.println(memberListJson);	
					//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
					out.write(memberListJson.toString());
					//�޸� �ʱ�ȭ
					out.flush();
		}
		
	
	//����� ������ �Է°��� ��� ȸ�� ����Ʈ ���̼� ������� �޾ƿ���
	@RequestMapping(value="/E_real_time", method = RequestMethod.GET)
	@ResponseBody
		public void E_real_time(@RequestParam(value="insert") String insert
					,Model model
					,HttpServletResponse re
					,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
				System.out.println("josn ȣ��Ȯ��");
				//ajax�� �޾ƿ� �Ű����� �Է°�
				System.out.println(insert+"�Է°�");
				//�ѱ�ȭ
				URLEncoder.encode(insert , "UTF-8");
				re.setCharacterEncoding("UTF-8");
				//out ��ü ����ϱ� ���� �غ�
				PrintWriter out = re.getWriter();
				int pagePerRow = 100;
		
				//json��� ���
				JSONArray memberListJson = null;
				//����Ʈ ���� ȣ��
				List<Member> list = Mdao.AjaxMemberList(currentPage, pagePerRow,insert);
				//�޾ƿ� ����Ʈ ���� ���̼� ��ü�� �־��� 
				memberListJson = JSONArray.fromObject(list);
				System.out.println(memberListJson);	
				//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
				out.write(memberListJson.toString());
				//�޸� �ʱ�ȭ
				out.flush();
	}
	
	
	//�˾�â ȣ��
	@RequestMapping(value="/popup.html", method = RequestMethod.GET)
	public String pop(Model model
					 ,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
		
		System.out.println("�˾�â ���� Ȯ��");

		
		return "test";
	}
	

	
	// �˻�ó�� �޼���
			@RequestMapping(value="/member_select",method = RequestMethod.GET)
			public String memberselect(HttpServletRequest request
					,Model model
					,@RequestParam(value="ScurrentPage",required=false,defaultValue="1" )int ScurrentPage){
				/*@RequestParam(value="selBox")String selBox*/
				//jsp���� �˻��� �ʿ��� ���� �޾ƿ´�.
				System.out.println("memberselect�޼��� ȣ��    Member_Controller.java");
				
				
				String search =	request.getParameter("search2");
				String selBox = request.getParameter("selBox");
				
				mVo m = new mVo();
				m.setSearch(search);
				m.setSelBox(selBox);
			    request.getSession().setAttribute("m", m);
				
				System.out.println("["+selBox+"]<---�˻� ���� memberselect �޼��� Member_Controller.java");
				System.out.println(search+"<---�˻��� memberselect �޼��� Member_Controller.java");
			
			    int SpagePerRow = 5;
				//�޼��� ȣ�� �迭�� �˻� �� ���ǿ� �´� ���� ��ƿ´�
				List<Member> Mlist = Mdao.searchMember(selBox, search,ScurrentPage,SpagePerRow);
				System.out.println(Mlist+"<--------- searchMember ���ϰ�Ȯ��");
				
				
				//�˻��� ������ �� ������ �ľ��ϴ� �޼��带 ȣ�� �� ������ ����ش�.
				int SmemberCount = Mdao.getsearchCount(selBox, search);
				
				//�޼��忡�� �޾ƿ� �� �����ϴ� �κ�	
				
				int Slastpage = (int)(Math.ceil((double)SmemberCount/(double)SpagePerRow));
				int Sexpage = 1;
				if(ScurrentPage == 0){
					ScurrentPage++;
				}else if(ScurrentPage >Slastpage){
					ScurrentPage = Slastpage;
				}
				
				model.addAttribute("ScurrentPage", ScurrentPage);
				model.addAttribute("SmemberCount",SmemberCount);
				model.addAttribute("SpagePerRow",SpagePerRow);
				model.addAttribute("Slastpage",Slastpage);
				model.addAttribute("Mlist",Mlist);
				model.addAttribute("Sexpage",Sexpage);
			
				
				
				
				
				return "/member/member_select";
			}
	//����Ʈ
	@RequestMapping(value="/member_list", method = RequestMethod.GET)
	public String MemberList(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage){
		System.out.println("MemberList �޼��� ���� Ȯ��  Member_Controller.java ");
		int memberCount = Mdao.getMemberCount();
		System.out.println(memberCount+"<-----memberCount �� Ȯ��");
		int pagePerRow = 10;
		int lastpage = (int)(Math.ceil((double)memberCount/(double)pagePerRow));
		int expage = 1;
		if(currentPage == 0){
			currentPage++;
		}else if(currentPage >lastpage){
			currentPage = lastpage;
		}
		
		
		//json��� ���
				JSONArray memberListJson = null;
				//����Ʈ ���� ȣ��
				List<Member> list = Mdao.getMemberList(currentPage, pagePerRow);		
	
		System.out.println(lastpage+"lastpage ���ϰ� Ȯ��");
		System.out.println(currentPage+"currentPage ���ϰ� Ȯ��");
		
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("memberCount",memberCount);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("lastpage",lastpage);
		model.addAttribute("list",list);
		model.addAttribute("expage",expage);
	
		
		return "/member/member_list";
		
	}
	
	//ȸ�� ���� ���� ���� ȭ��
	@RequestMapping(value="/member_information_view" ,method = RequestMethod.GET)
	public String memberView(Model model,@RequestParam(value="member_phone",required=false,defaultValue="1")String member_phone){
		System.out.println("memberView �޼��� ���� Ȯ��  Member_Controller.java ");
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		return "/member/member_information_view";
		
	}
	
	//����ó�� ȭ�� ��� �޼��� 
	@RequestMapping(value ="/member_update", method = RequestMethod.GET)
		public String update(Model model,@RequestParam(value="member_phone")String member_phone){
			System.out.println("update �޼��� ȣ��    Member_Controller.java");
			Member m = Mdao.getMember(member_phone);
			model.addAttribute("Member",m);
			
		return "/member/member_Update";
		}
	//����ó�� �޼���
	@RequestMapping(value ="/member_update", method = RequestMethod.POST)
	public String update_Action(Member m){
		System.out.println("update_Action�޼��� ȣ��    Member_Controller.java");
		System.out.println(m.getMember_phone()+"<=-----------");
		Mdao.Mupdate(m);
	return "redirect:member_information_view?member_phone="+m.getMember_phone();
	}
	//����ȭ�� ��� �޼���
	@RequestMapping(value="/member_Secede",method = RequestMethod.GET)
	public String memberDeletePage(Model model , @RequestParam(value="member_phone")String member_phone){
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		
		System.out.println("memberDeletePage �޼��� ȣ��    Member_Controller.java");
		return "/member/member_Secede";
	}
	// ����ó�� �޼���
		@RequestMapping(value="/member_SecedeAction",method = RequestMethod.POST)
		public String memberDelete(@RequestParam(value="member_phone")String member_phone){
			System.out.println("memberDelete�޼��� ȣ��    Member_Controller.java");
			Mdao.deleteMember(member_phone);
			return "redirect:member_list";
		}
		
	

}
