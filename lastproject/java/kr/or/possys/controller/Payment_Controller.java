package kr.or.possys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Cancel_Payment_service.Payment_Cancel_Dao;
import kr.or.possys.Card_Payment_service.Card_Payment;
import kr.or.possys.Card_Payment_service.Card_Payment_Dao;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Payment_service.Payment_Dao;

@Controller
public class Payment_Controller {
	@Autowired
	private Payment_Dao pdao;
	@Autowired
	private Payment_Cancel_Dao pcdao;
	//pcdao : �������DAO
	@Autowired
	private Card_Payment_Dao cpdao;
	//cpdao : ī�����DAO
	
	// view �������� ����� ǥ�õǵ��� �ϱ� ���ؼ� �ٸ� ��Ʈ�ѷ��� ��Ʈ(/) ���� ��� ����ų� �ּ�ó���س���
	
	//Staff ��Ʈ�ѷ����� login �������� �������� ������ ���� �ּ�ó�� �ߴ� ��� �ٸ��� ��Ƽ� �����ٶ�
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		System.out.println("start");
		return "tori_home";
	}*/
	
	//����Ʈ �Է� ������ �̵��Ѵ�
	@RequestMapping(value="/tori/payment/payment_add_form", method = RequestMethod.GET)
	public String paymentadd(){
		System.out.println("01 Payment_Controller.java -> paymentadd");
		return "/tori/payment/payment_add_form";
		//tori_home���� ������ ��ο� ���ΰ�ΰ� �� ���ϰ��� ��ġ�ϰԲ� �����Ѵ�.
		
	}
	
	//�Է� ��û : �׼����� �̵��Ѵ�
	@RequestMapping(value="/tori/payment/payment_add_action", method = RequestMethod.POST)
	public String paymentadd(Payment Payment){
		System.out.println("01_1 Payment_Controller.java -> paymentadd");
		
		String id = Payment.getPayment_id();
		System.out.println(id+"<------ ��Ʈ�ѷ� �� Ȯ�� ");
		
		
		pdao.insertPayment(Payment);
		return "redirect:/tori/payment/payment_list";
		
	}
	
	//����Ʈ�� ���� �޾ƿ´�
	@RequestMapping(value={"/tori/payment/payment_list"}, method = RequestMethod.GET)
	public String paymentlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("02_Payment_Controller.java -> paymentlist");
		int paymentcount = pdao.getPaymentCount();
		System.out.println(paymentcount);
		System.out.println("02_1 Payment_Controller.java -> paymentlist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)paymentcount/(double)pagePerRow));
		List<Payment> list = pdao.getPaymentList(currentPage, pagePerRow);
		System.out.println(paymentcount);
		System.out.println(Math.ceil(paymentcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
		
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentcount", paymentcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list",list);
		
		return "/tori/payment/payment_list";
		
	}
	
	
	//����Ʈ���� ��� �Ѿ��
	@RequestMapping(value={"/tori/payment/payment_view"}, method = RequestMethod.GET)
	public String paymentview(Model model , @RequestParam(value="payment_id",required=true) String payment_id){
		System.out.println("03_Payment_Controller.java -> paymentview");
		Payment payment = pdao.getPayment(payment_id);
		model.addAttribute("payment",payment);
		return "/tori/payment/payment_view";
	}
	
	//�˻���ư�� Ŭ���� �� �˻�ȭ������ �Ѿ��
	@RequestMapping(value={"/tori/payment/payment_search_form"}, method = RequestMethod.GET)
	public String paymentsearch(){
		System.out.println("04 Payment_Controller.java -> paymentsearch");
		return "/tori/payment/payment_search_form";
		//tori_home���� ������ ��ο� ���ΰ�ΰ� �� ���ϰ��� ��ġ�ϰԲ� �����Ѵ�.
		
	}
	
	//���Ǻ� �˻� ����Ʈ ǥ��
	@RequestMapping(value="/tori/payment/payment_search_action", method = RequestMethod.GET)
	public String paymentSRsearch(Model model , 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="select") String select,
			@RequestParam(name="keyWord") String keyWord){
		System.out.println("05 Payment_Controller.java -> paymentSRlist");
		//int paymentSRcount = pdao.paymentSRsearch(select,keyWord);
		int paymentSRcount = pdao.getPaymentCount();
		int pagePerRow = 10;
		int lastPage = (int)(Math.ceil((double)paymentSRcount/(double)pagePerRow));
		List<Payment> list = pdao.paymentSRlist(select,keyWord,currentPage,pagePerRow);
		int expage = 1;
		
		model.addAttribute("select",select);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentSRcount",paymentSRcount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("list",list);
		
		return "/tori/payment/payment_search_list";
	}
	
	
	//���Ǻ� �˻���� ����Ʈ ǥ��
	@RequestMapping(value="/tori/payment/payment_search_list", method = RequestMethod.GET)
	public String paymentsearchlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("06_Payment_Controller.java -> paymentlist");
		int paymentSRcount = pdao.getPaymentCount();
		System.out.println(paymentSRcount);
		System.out.println("06_1 Payment_Controller.java -> paymentlist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)paymentSRcount/(double)pagePerRow));
		List<Payment> list = pdao.getPaymentList(currentPage, pagePerRow);
		System.out.println(paymentSRcount);
		System.out.println(Math.ceil(paymentSRcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
		
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentSRcount", paymentSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list",list);
		
		return "/tori/payment/payment_search_list";
		
	}
	
	// ���� ��� ��� ����
	
	//����Ʈ �Է� ������ �̵��Ѵ�
		@RequestMapping(value="/tori/payment/payment_cancel_form", method = RequestMethod.GET)
		public String paymentcanceladd(){
			System.out.println("01 Payment_Controller.java -> paymentcanceladd");
			return "/tori/payment/payment_cancel_form";
			//tori_home���� ������ ��ο� ���ΰ�ΰ� �� ���ϰ��� ��ġ�ϰԲ� �����Ѵ�.
			
		}
		
		//�Է� ��û : �׼����� �̵��Ѵ�
		@RequestMapping(value="/tori/payment/payment_cancel_action", method = RequestMethod.POST)
		public String paymentcanceladd(Payment_Cancel payment_cancel){
			System.out.println("01_1 Payment_Controller.java -> paymentadd");
			
			String id = payment_cancel.getPayment_id();
			System.out.println(id+"<------ ��Ʈ�ѷ� �� Ȯ�� ");
			
			
			pcdao.insertPaymentCancel(payment_cancel);
			return "redirect:/tori/payment/payment_cancel_list";
			
		}
		
		//����Ʈ�� ���� �޾ƿ´�
		@RequestMapping(value={"/tori/payment/payment_cancel_list"}, method = RequestMethod.GET)
		public String paymentcancellist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
			System.out.println("02_Payment_Controller.java -> paymentcancellist");
			int paymentcancelcount = pcdao.getPaymentCancelCount();
			System.out.println(paymentcancelcount);
			System.out.println("02_1 Payment_Controller.java -> paymentcancellist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentcancelcount/(double)pagePerRow));
			List<Payment_Cancel> list = pcdao.getPaymentCancelList(currentPage, pagePerRow);
			System.out.println(paymentcancelcount);
			System.out.println(Math.ceil(paymentcancelcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
			
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentcancelcount", paymentcancelcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list",list);
			
			return "/tori/payment/payment_cancel_list";
			
		}
		
		
		//����Ʈ���� ��� �Ѿ��
		@RequestMapping(value={"/tori/payment/payment_cancel_view"}, method = RequestMethod.GET)
		public String paymentcancelview(Model model , @RequestParam(value="payment_cancel_id",required=true) String payment_id){
			System.out.println("03_Payment_Controller.java -> paymentcancelview");
			Payment payment = pdao.getPayment(payment_id);
			model.addAttribute("payment",payment);
			return "/tori/payment/payment_cancel_view";
		}
	
	
		
		
	// ī�� ���� ��� ����
		
		//����Ʈ �Է� ������ �̵��Ѵ�
		@RequestMapping(value="/tori/payment/payment_card_form", method = RequestMethod.GET)
		public String paymentcardadd(){
			System.out.println("01 Payment_Controller.java -> paymentcardadd");
			return "/tori/payment/payment_card_form";
			//tori_home���� ������ ��ο� ���ΰ�ΰ� �� ���ϰ��� ��ġ�ϰԲ� �����Ѵ�.
			
		}
		
		//�Է� ��û : �׼����� �̵��Ѵ�
		@RequestMapping(value="/tori/payment/payment_card_action", method = RequestMethod.POST)
		public String paymentcardadd(Card_Payment card_payment){
			System.out.println("01_1 Payment_Controller.java -> paymentcardadd");
			
			String id = card_payment.getCard_id();
			System.out.println(id+"<------ ��Ʈ�ѷ� �� Ȯ�� ");
			
			
			cpdao.insertCardPayment(card_payment);
			return "redirect:/tori/payment/payment_card_list";
			
		}
		
		//����Ʈ�� ���� �޾ƿ´�
		@RequestMapping(value={"/tori/payment/payment_card_list"}, method = RequestMethod.GET)
		public String paymentcardlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
			System.out.println("02_Payment_Controller.java -> paymentcardlist");
			int paymentcardcount = cpdao.getCardPaymentCount();
			System.out.println(paymentcardcount);
			System.out.println("02_1 Payment_Controller.java -> paymentcardlist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentcardcount/(double)pagePerRow));
			List<Card_Payment> list = cpdao.getCardPaymentList(currentPage, pagePerRow);
			System.out.println(paymentcardcount);
			System.out.println(Math.ceil(paymentcardcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
			
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentcardcount", paymentcardcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list",list);
			
			return "/tori/payment/payment_card_list";
			
		}
		
		
		//����Ʈ���� ��� �Ѿ��
		@RequestMapping(value={"/tori/payment/payment_card_view"}, method = RequestMethod.GET)
		public String paymentcardview(Model model , @RequestParam(value="card_id",required=true) String card_id){
			System.out.println("03_Payment_Controller.java -> paymencardview");
			Card_Payment card = cpdao.getCardPayment(card_id);
			model.addAttribute("card",card);
			return "/tori/payment/payment_card_view";
		}
}
	
	

