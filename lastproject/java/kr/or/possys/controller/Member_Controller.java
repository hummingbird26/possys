package kr.or.possys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Member_sevice.Member;
import kr.or.possys.Member_sevice.Member_Dao;
import kr.or.possys.Member_sevice.expense_folios;
import kr.or.possys.Member_sevice.mVo;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.ep_order_food_details_service.Ep_Order;
import net.sf.json.JSONArray;
import kr.or.possys.Member_sevice.receipt;
@Controller
public class Member_Controller {

	@Autowired
	private	Member_Dao	Mdao;
	
	@Autowired
	private	Order_Dao	odao;
	
	@Autowired
	private Staff_Dao sdao;
	
	
/*	@RequestMapping(value="/expense_folios")
	public String expense_folios(){
		System.out.println("expense_folios_메서드 실행 확인 Member_Controller.java");
		return "/member/expense_folios";
	}*/
	
	//매장 월 판매금액 & 지춝므액 구하는 메서드
	@RequestMapping(value="/expense_folios")
	
	public String expense_folios_action(Model model){
		System.out.println("expense_folios_action 메서드 실행 확인  Member_Controller.java");
		
		
		//어레이 리스트로 expense_folios 배열 생성 
		ArrayList<expense_folios> arr = new ArrayList<expense_folios>();
		
		//월별 총 판매액과 발주 신청금액 구해서 각각 변수에 담아준다. 
		List<Ep_Order> o_list = Mdao.expense_folios();
		List<Payment> sum_payment = Mdao.sum_payment();
		
		System.out.println(o_list);
		System.out.println(sum_payment.size()+"<<<<sum_payment.size()");
		//for문을 사용하여 expense_folios dto로 선언한 객체를 만들면서 
		//변수에 담겨있던 값을 담아준다.
		
			
		if(o_list.size()==0){
			for (int i = 0; i < sum_payment.size(); i++){
				int p_total = sum_payment.get(i).getPayment_total();
				expense_folios expense_folios = new expense_folios();
			
				int total_result = p_total;
				
				expense_folios.setPayment_date(sum_payment.get(i).getPayment_date());
				expense_folios.setPayment_total(p_total);
				expense_folios.setTotal_result(total_result);
				
				arr.add(expense_folios);
				System.out.println("if 문 olist"+i+"번 반복 expense_folios_action 메서드 Member_Controller.java");
				}
			}
		if(o_list.size()>0){
			for (int i = 0; i < sum_payment.size(); i++){
				int p_total = sum_payment.get(i).getPayment_total();
				
				int o_total = o_list.get(i).getEp_order_total_price();
				
				//두 금액의 차를 구하여 결과값을 변수에 담아준다.
				int total_result = (p_total-o_total);
				//반복 할때마다 새로운 객체 생성(값이 중복 안되게 해준다.)
				expense_folios expense_folios = new expense_folios();
				
				expense_folios.setPayment_date(sum_payment.get(i).getPayment_date());
				expense_folios.setPayment_total(p_total);
				
				
				expense_folios.setEp_order_wh_date(o_list.get(i).getEp_order_wh_date());
				expense_folios.setEp_order_total_price(o_total);
				//dto에 변수생성하고 거기에 위에서 변수에 담은 값을 셋팅  해준다.
				expense_folios.setTotal_result(total_result);
				
				
				arr.add(expense_folios);
				System.out.println("else if 문 olist"+i+"번 반복 expense_folios_action 메서드 Member_Controller.java");
		
			
			}
		}
		model.addAttribute("expense_folios", arr);
		
		/*광진이형
		for(Ep_Order _o_list : o_list){
			expense_folios.setEp_order_total_price(_o_list.getEp_order_total_price());
			expense_folios.setEp_order_wh_date(_o_list.getEp_order_wh_date());			
			arr.add(expense_folios);
		}
		
		for(Payment pay : sum_payment){
			expense_folios.setPayment_date(pay.getPayment_date());
			expense_folios.setPayment_total(pay.getPayment_total());
			arr.add(expense_folios);
		}
		System.out.println(arr.size()+"///사이즈");
		model.addAttribute("expense_folios", arr);*/
	
		
		

		return "/member/expense_folios";
	}
	
	//회원 리스트에서 상세보기 클릭시 회원별 이용내역 확인
	@RequestMapping(value="/ajax_receipt_list", method=RequestMethod.GET)
	@ResponseBody
	public void receipt_list(HttpServletResponse re
					,@RequestParam(value="member_phone")String member_phone) throws IOException{
		
		
		System.out.println("receipt_list 메서드 실행 확인 Member_Controller.java");
		System.out.println(member_phone+"<<--member_phone의 값 receipt_list 메서드 실행 확인 Member_Controller.java");
		 
			re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			
			JSONArray receipt_list = null;
			
			List<receipt> receipt = Mdao.receipt_list(member_phone);
			
			System.out.println(receipt);
			
			receipt_list = JSONArray.fromObject(receipt);
			System.out.println(receipt_list);
				
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(receipt_list.toString());
			
			out.flush();
		
		
	}
	
	//회원가입 화면 출력 메서드
	@RequestMapping(value="/member/sign_up")
	public String sign_up(){
		System.out.println("sign_up 회원가입 화면 출력 메서드 Member_Controller");
		
		
		return "/member/sign_up";
	}
	//회원가입 처리 메서드
	@RequestMapping(value="/sign_up_action")
	public String sign_up_action(Member m){
		System.out.println("sign_up_action 회원가입 화면 출력 메서드 Member_Controller");
/*		System.out.println(m.getMember_phone()+"getMember_phone");
		System.out.println(m.getMember_name()+"getMember_name");
		System.out.println(m.getMember_email()+"getMember_email");*/
		Mdao.sign_up_action(m);
		return "/member/sign_up";
	}
	
	
	//영수증 화면 출력 메서드
	@RequestMapping(value="/receipt")
	public String receipt(Model model
			,@RequestParam(value="table_order_id")String table_order_id
			,@RequestParam(value="member_phone")String member_phone
			){
		System.out.println("receipt 메서드 실행 Member_Controller.java");
		System.out.println(table_order_id +"table_order_id 값 receipt 메서드 실행 Member_Controller.java");
		System.out.println(member_phone +"member_phone 값 receipt 메서드 실행 Member_Controller.java");
		
		List<receipt> receiptList = Mdao.receipt(member_phone, table_order_id);
		
		model.addAttribute("receiptList", receiptList);
		System.out.println(receiptList+"<<<<<<<<<<<receiptList 리턴 값");
		
		return "/member/receipt";
	}
	
	
	
	//테이블 자리 이동
	@RequestMapping(value="/table_move_D", method=RequestMethod.POST)
	@ResponseBody
	public void table_move(@RequestParam(value="table_order_id")String table_order_id
			,@RequestParam(value="table_num")int table_num){
		System.out.println("table_move 메서드 실행"+table_order_id+"<<<<<<<<<<<<<<<table_order_id");
		System.out.println("table_move 메서드 실행"+table_num+"<<<<<<<<<<<<<<<table_num");
		
		Mdao.table_move(table_order_id, table_num);
		
	}
	//테이블 true,false 확인
	@ResponseBody
	@RequestMapping(value="/table_state")
	public void table_state(HttpServletResponse re) throws IOException{
		/*System.out.println("table_state 메서드 실행 확인 Member_Controller.java");*/
		   re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray table_state = null;
			
			List<Order> state = Mdao.table_state();
			
			/*System.out.println(plist);*/
			
			table_state = JSONArray.fromObject(state);
			/*System.out.println(table_state);*/
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(table_state.toString());
			
			out.flush();
	}
	
	
	
	// 테이블 배치 화면으로 이동
	  @RequestMapping(value = "/table")
	  public String table() {
	   System.out.println("테이블 배치 화면 이동 메서드 ");
	    return "/member/table";	    
	  } 
	//테이블 주문 내역 확인
	  @ResponseBody
	  @RequestMapping(value = "/table_order",method = RequestMethod.GET)
	  public void table_order(HttpServletResponse re,@RequestParam(value="table_order_num") String table_order_num) throws IOException{
		  System.out.println("테이블 주문내역 확인 메서드 Member_Controller.java");
		 
		 re.setCharacterEncoding("UTF-8");
		  
		PrintWriter out = re.getWriter();
		JSONArray order_detail = null;
		
		List<Order> order = Mdao.table_Order_detail(table_order_num);
		/*if(staff!=null){*/
		
		/*System.out.println(plist);*/
		
		order_detail = JSONArray.fromObject(order);
		/*System.out.println(order_detail);*/
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(order_detail.toString());
		
		out.flush();
		  
	
	  }
	  
	  // 비밀번호 재발급 화면 이동
	  @RequestMapping(value = "/repw")
	  public String repw() {
	   System.out.println("비밀번호 재발급 화면 이동 메서드 ");
	    return "/repw";
	  }  
	// 비밀번호 찾기  아이디와  name값 가져오는 ajax통신용
	  @ResponseBody
	  @RequestMapping(value = "/idcheck")
	  public void mailForm(HttpServletRequest request,HttpServletResponse re) throws IOException {
		  String checkid = request.getParameter("id");
		  System.out.println(checkid);
		 
		  	re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray CheckStaff = null;
			
			Staff staff = sdao.loginSelect(checkid);
			if(staff!=null){
			
			
			CheckStaff = JSONArray.fromObject(staff);
			System.out.println(CheckStaff);
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(CheckStaff.toString());
			
			out.flush();
	   
	  }
	  }
	  // 비밀번호 찾기 후 신규 pw 재발급 후 db등록 및  이메일 발송 코드 
	
	/*  @RequestMapping(value="/mail/mailSending",method = RequestMethod.POST)
	  public String mailSending(HttpServletRequest request){
		  System.out.println("메일보내기");
		  			//입력받은 email 값 id값 각각 변수에 담는다.
		  			String tomail = request.getParameter("email");
		  			String checkid = request.getParameter("id");
		  			System.out.println(checkid);
		  			Staff staff = sdao.loginSelect(checkid);
		  			System.out.println(staff+"<---mailSending 메서드 아이디 입력후 리턴값 Member_Controller.java");
					String setfrom = "bsh20057@gmail.com";
					String title = "possys 비밀번호 재발급 안내입니다.";
				    String content ="";
				    String newpw = "";
				    for (int i = 0;i < 5; i++) { 
				        // UUID uuid = UUID.randomUUID() // UUID 자체는 Object 타입 
				    	String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
				        uuid = uuid.substring(0, 6); //uuid를 앞에서부터 10자리 잘라줌. 
				        content = "신규 비밀번호 입니다. 로그인 후 수정 해주세요 \n"
				        		+ "신규 비밀번호 :"+uuid;
				        newpw = uuid;
				    }
				    
				    
				    
				    staff.setStaff_pw(newpw);
				    staff.getStaff_name();
				    staff.getStaff_level();
				    staff.getStaff_age();
				    staff.getStaff_addr();
				    staff.getStaff_gender();
				    staff.getStaff_phone();
				    staff.getStaff_date();
				    staff.getStaff_id();	    
			
				    System.out.println(staff.getStaff_pw()+"<<<<<<<확인");
				    //신규 비밀번호로 업데이트
				    sdao.updateStaff(staff);
				  
				    System.out.println("새로운 비밀번호"+newpw);
				    System.out.println("받는사람 이메일"+tomail);
				    System.out.println("이메일 제목"+title);
				    System.out.println("이메일 내용"+content);
				    try {
				      MimeMessage message = mailSender.createMimeMessage();
				      
				      MimeMessageHelper messageHelper 
				                        = new MimeMessageHelper(message, true, "UTF-8");
				 
				      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				      messageHelper.setTo(tomail);     // 받는사람 이메일
				      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				      messageHelper.setText(content);  // 메일 내용
				     
				      mailSender.send(message);
				    } catch(Exception e){
				      System.out.println(e);
				    }
					return "redirect:/";
					
			}
*/
	  
 
	
	
	//그래프 출력 화면 호출 메서드
	@RequestMapping(value="/total_payment")
	public String total_payment(){
		return "/member/total_payment";
	}
	//카드결제 메서드(취소)
		@RequestMapping(value="/C_CDcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_CDcatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_CDcatePayment 메서드 실행 확인 Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_CDcatePayment = null;
			
			List<Payment_Cancel> CDcate = Mdao.C_CDcatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_CDcatePayment = JSONArray.fromObject(CDcate);
			System.out.println(C_CDcatePayment);
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(C_CDcatePayment.toString());
			
			out.flush();
		}
		//현금결제 메서드(취소)
		@RequestMapping(value="/C_Mcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_McatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_McatePayment 메서드 실행 확인 Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_McatePayment = null;
			
			List<Payment_Cancel> Mcate = Mdao.C_McatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_McatePayment = JSONArray.fromObject(Mcate);
			System.out.println(C_McatePayment);
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(C_McatePayment.toString());
			
			out.flush();
		}
		//통합매출내역(취소)
		@RequestMapping(value="/C_graph",method = RequestMethod.GET)
		@ResponseBody
		public void C_totalPayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_totalPayment 메서드 실행 확인 Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_totalPayment = null;
			
			List<Payment_Cancel> plist = Mdao.C_totalPaymentList(selbox);
			
			/*System.out.println(plist);*/
			
			C_totalPayment = JSONArray.fromObject(plist);
			System.out.println(C_totalPayment);
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(C_totalPayment.toString());
			
			out.flush();
		}
	
	//카드결제 메서드
	@RequestMapping(value="/CDcate",method = RequestMethod.GET)
	@ResponseBody
	public void CDcatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment 메서드 실행 확인 Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray CDcatePayment = null;
		
		List<Payment> CDcate = Mdao.CDcatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		CDcatePayment = JSONArray.fromObject(CDcate);
		System.out.println(CDcatePayment);
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(CDcatePayment.toString());
		
		out.flush();
	}
	//현금결제 메서드
	@RequestMapping(value="/Mcate",method = RequestMethod.GET)
	@ResponseBody
	public void McatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment 메서드 실행 확인 Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray McatePayment = null;
		
		List<Payment> Mcate = Mdao.McatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		McatePayment = JSONArray.fromObject(Mcate);
		System.out.println(McatePayment);
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(McatePayment.toString());
		
		out.flush();
	}
	//통합매출내역
	@RequestMapping(value="/graph",method = RequestMethod.GET)
	@ResponseBody
	public void totalPayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment 메서드 실행 확인 Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray PaymentList = null;
		
		List<Payment> plist = Mdao.totalPaymentList(selbox);
		
		/*System.out.println(plist);*/
		
		PaymentList = JSONArray.fromObject(plist);
		System.out.println(PaymentList);
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(PaymentList.toString());
		
		out.flush();
	}
	//알람창 ajax 테스트
	@RequestMapping(value="/alram_test",method = RequestMethod.GET)
	@ResponseBody
	public void am(HttpServletResponse re) throws IOException{
		System.out.println("am 실행");
		//한글화
		re.setCharacterEncoding("UTF-8");
		//out 객체 사용하기 위해 준비
		PrintWriter out = re.getWriter();
		JSONArray OrderListJson = null;
		
		List<Order> olist = odao.order_list();
		System.out.println(olist);
		
		OrderListJson = JSONArray.fromObject(olist);
		System.out.println(OrderListJson);
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(OrderListJson.toString());
		
		out.flush();
	
	}
	//알람창 호출
	@RequestMapping(value="/ho.html")
	public String alram(){
		System.out.println("알람창 호출");
		return "/member/alram";
	}

	//실시간 검색 호출
	@RequestMapping(value="/real_time")
	public String real_time(Model model){	
		int memberCount = Mdao.getMemberCount();
		model.addAttribute("memberCount",memberCount);
		return "/member/real_time";
	}
	
	//입력값이 한글인 경우 회원 리스트 제이손 방식으로 받아오기
		@RequestMapping(value="/K_real_time", method = RequestMethod.GET)
		@ResponseBody
			public void K_real_time(@RequestParam(value="insert") String insert
						,Model model
						,HttpServletResponse re
						,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
					System.out.println("josn 호출확인");
					//ajax로 받아온 매개변수 입력값
					System.out.println(insert+"입력값");
					//한글화
					URLEncoder.encode(insert , "UTF-8");
					re.setCharacterEncoding("UTF-8");
					//out 객체 사용하기 위해 준비
					PrintWriter out = re.getWriter();
					int pagePerRow = 100;
			
					//json방식 사용
					JSONArray memberListJson = null;
					//리스트 쿼리 호출
					List<Member> list = Mdao.K_AjaxMemberList(currentPage, pagePerRow, insert);
					//받아온 리스트 값을 제이손 객체에 넣어줌 
					memberListJson = JSONArray.fromObject(list);
					System.out.println(memberListJson);	
					//새로운 화면에서 json방식으로 받아온 값 출력
					out.write(memberListJson.toString());
					//메모리 초기화
					out.flush();
		}
		
	
	//영어와 숫자인 입력값일 경우 회원 리스트 제이손 방식으로 받아오기
	@RequestMapping(value="/E_real_time", method = RequestMethod.GET)
	@ResponseBody
		public void E_real_time(@RequestParam(value="insert") String insert
					,Model model
					,HttpServletResponse re
					,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
				System.out.println("josn 호출확인");
				//ajax로 받아온 매개변수 입력값
				System.out.println(insert+"입력값");
				//한글화
				URLEncoder.encode(insert , "UTF-8");
				re.setCharacterEncoding("UTF-8");
				//out 객체 사용하기 위해 준비
				PrintWriter out = re.getWriter();
				int pagePerRow = 100;
		
				//json방식 사용
				JSONArray memberListJson = null;
				//리스트 쿼리 호출
				List<Member> list = Mdao.AjaxMemberList(currentPage, pagePerRow,insert);
				//받아온 리스트 값을 제이손 객체에 넣어줌 
				memberListJson = JSONArray.fromObject(list);
				System.out.println(memberListJson);	
				//새로운 화면에서 json방식으로 받아온 값 출력
				out.write(memberListJson.toString());
				//메모리 초기화
				out.flush();
	}
	
	
	//팝업창 호출
	@RequestMapping(value="/popup.html", method = RequestMethod.GET)
	public String pop(Model model
					 ,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
		
		System.out.println("팝업창 실행 확인");

		
		return "test";
	}
	

	
	// 검색처리 메서드
			@RequestMapping(value="/member_select",method = RequestMethod.GET)
			public String memberselect(HttpServletRequest request
					,Model model
					,@RequestParam(value="ScurrentPage",required=false,defaultValue="1" )int ScurrentPage){
				/*@RequestParam(value="selBox")String selBox*/
				//jsp에서 검색에 필요한 값을 받아온다.
				System.out.println("memberselect메서드 호출    Member_Controller.java");
				
				
				String search =	request.getParameter("search2");
				String selBox = request.getParameter("selBox");
				
				mVo m = new mVo();
				m.setSearch(search);
				m.setSelBox(selBox);
			    request.getSession().setAttribute("m", m);
				
				System.out.println("["+selBox+"]<---검색 조건 memberselect 메서드 Member_Controller.java");
				System.out.println(search+"<---검색어 memberselect 메서드 Member_Controller.java");
			
			    int SpagePerRow = 5;
				//메서드 호출 배열로 검색 한 조건에 맞는 값을 담아온다
				List<Member> Mlist = Mdao.searchMember(selBox, search,ScurrentPage,SpagePerRow);
				System.out.println(Mlist+"<--------- searchMember 리턴값확인");
				
				
				//검색한 조건의 총 개수를 파악하는 메서드를 호출 후 변수에 담아준다.
				int SmemberCount = Mdao.getsearchCount(selBox, search);
				
				//메서드에서 받아온 값 셋팅하는 부분	
				
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
	//리스트
	@RequestMapping(value="/member_list", method = RequestMethod.GET)
	
	public String MemberList(
			Model model
			,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage){
		System.out.println("MemberList 메서드 실행 확인  Member_Controller.java ");
		int memberCount = Mdao.getMemberCount();
		System.out.println(memberCount+"<-----memberCount 값 확인");
		int pagePerRow = 10;
		int lastpage = (int)(Math.ceil((double)memberCount/(double)pagePerRow));
		int expage = 1;
		if(currentPage == 0){
			currentPage++;
		}else if(currentPage >lastpage){
			currentPage = lastpage;
		}
		
		
		//json방식 사용
				JSONArray memberListJson = null;
				//리스트 쿼리 호출
				List<Member> list = Mdao.getMemberList(currentPage, pagePerRow);		
				
				System.out.println(lastpage+"lastpage 리턴값 확인");
				System.out.println(currentPage+"currentPage 리턴값 확인");
				
				memberListJson = JSONArray.fromObject(list);
				
				model.addAttribute("jsonString", memberListJson);
				
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("memberCount",memberCount);
				model.addAttribute("pagePerRow",pagePerRow);
				model.addAttribute("lastpage",lastpage);
				model.addAttribute("list",list);
				model.addAttribute("expage",expage);
			
		
		return "/member/member_list";
		
	}
	
	//회원 개인 정보 열람 화면
	@RequestMapping(value="/member_information_view" ,method = RequestMethod.GET)
	public String memberView(Model model,@RequestParam(value="member_phone",required=false,defaultValue="1")String member_phone){
		System.out.println("memberView 메서드 실행 확인  Member_Controller.java ");
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		return "/member/member_information_view";
		
	}
	
	//동적 수정화면 연습
	@RequestMapping(value ="/ajax_member_update", method = RequestMethod.GET)
	@ResponseBody
	public void ajax_update(
			 HttpServletResponse re
			,@RequestParam(value="member_phone")String member_phone) throws IOException{
		System.out.println("동적 수정처리 update 메서드 호출    Member_Controller.java");
		
		/*model.addAttribute("Member",m);*/
		URLEncoder.encode(member_phone , "UTF-8");
		re.setCharacterEncoding("UTF-8");
		//out 객체 사용하기 위해 준비
		PrintWriter out = re.getWriter();
		//json방식 사용
		JSONArray J_member_update = null;
		//한명의 회원정보 출력 쿼리 호출
		Member member_update = Mdao.getMember(member_phone);
		//받아온 회원정보를 제이손 객체에 넣어줌 
		J_member_update = JSONArray.fromObject(member_update);
		System.out.println(J_member_update);	
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(J_member_update.toString());
		//메모리 초기화
		out.flush();
	}
	
	
	//동적 수정처리 메서드 연습
		@RequestMapping(value ="/ajax_member_update_action", method = RequestMethod.POST)
		@ResponseBody
		public void ajax_update_Action(
					@RequestParam(value="member_join")String member_join
					,@RequestParam(value="member_name")String member_name
					,@RequestParam(value="member_phone")String member_phone
					,@RequestParam(value="member_point")int member_point
					,@RequestParam(value="member_sign")String member_sign
					,@RequestParam(value="p_member_phone")String p_member_phone){
			System.out.println("ajax_update_Action 메서드 실행");
		/*	System.out.println(member_join+"member_join Member_Controller.java");
			System.out.println(member_name+"member_name Member_Controller.java");
			System.out.println(member_phone+"Member_Controller.java");
			System.out.println(member_point+"Member_Controller.java");
			System.out.println(member_sign+"Member_Controller.java");*/
			System.out.println(member_phone+"<<<member_phone  수정처리 입력 값 Member_Controller.java");
			System.out.println(p_member_phone+"<<<p_member_phone  조회할 핸드폰 번호 Member_Controller.java");
			Member m = new Member();
			m.setMember_join(member_join);
			m.setMember_name(member_name);
			m.setMember_phone(member_phone);
			m.setMember_point(member_point);
			m.setMember_sign(member_sign);
			
			m.setP_member_phone(p_member_phone);
			System.out.println(m.getMember_phone()+"입력받은 핸드폰 번호<=-----------");
			System.out.println(m.getMember_phone()+"조회할 핸드폰 번호<=-----------");
			Mdao.Mupdate(m);
		
		}
	
	//수정처리 화면 출력 메서드 
	@RequestMapping(value ="/member_update", method = RequestMethod.GET)
		public String update(Model model,@RequestParam(value="member_phone")String member_phone){
			System.out.println("update 메서드 호출    Member_Controller.java");
			Member m = Mdao.getMember(member_phone);
			model.addAttribute("Member",m);
			
		return "/member/member_Update";
		}
	//수정처리 메서드
	@RequestMapping(value ="/member_update", method = RequestMethod.POST)
	public String update_Action(Member m){
		System.out.println("update_Action메서드 호출    Member_Controller.java");
		System.out.println(m.getMember_phone()+"<=-----------");
		Mdao.Mupdate(m);
	return "redirect:member_information_view?member_phone="+m.getMember_phone();
	}
	//삭제화면 출력 메서드
	@RequestMapping(value="/member_Secede",method = RequestMethod.GET)
	public String memberDeletePage(Model model , @RequestParam(value="member_phone")String member_phone){
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		
		System.out.println("memberDeletePage 메서드 호출    Member_Controller.java");
		return "/member/member_Secede";
	}
	// 삭제처리 메서드
		@RequestMapping(value="/member_SecedeAction",method = RequestMethod.POST)
		public String memberDelete(@RequestParam(value="member_phone")String member_phone){
			System.out.println("memberDelete메서드 호출    Member_Controller.java");
			Mdao.deleteMember(member_phone);
			return "redirect:member_list";
		}
		
	

}
