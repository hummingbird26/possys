package kr.or.possys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Member_sevice.Member;
import kr.or.possys.Member_sevice.Member_Dao;
import kr.or.possys.Member_sevice.mVo;

@Controller
public class Member_Controller {

	@Autowired
	private	Member_Dao	Mdao;
	// 검색처리 메서드
			@RequestMapping(value="/member_select",method = RequestMethod.GET)
			public String memberselect(HttpServletRequest request
					,Model model
					,@RequestParam(value="ScurrentPage",required=false,defaultValue="1" )int ScurrentPage){
				/*@RequestParam(value="selBox")String selBox*/
				//jsp에서 검색에 필요한 값을 받아온다.
				System.out.println("memberselect메서드 호출    Member_Controller.java");
				
				
				String search =	request.getParameter("search");
				String selBox = request.getParameter("selBox");
				
				mVo m = new mVo();
				m.setSearch(search);
				m.setSelBox(selBox);
			    request.getSession().setAttribute("m", m);
				
				/*System.out.println("["+selBox+"]<---검색 조건 memberselect 메서드 Member_Controller.java");
				System.out.println(search+"<---검색어 memberselect 메서드 Member_Controller.java");
				*/
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
	public String MemberList(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage){
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
		
		List<Member> list = Mdao.getMemberList(currentPage, pagePerRow);
		System.out.println(lastpage+"lastpage 리턴값 확인");
		System.out.println(currentPage+"currentPage 리턴값 확인");
		
		
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
	public String memberView(Model model,@RequestParam(value="member_phone",required=false,defaultValue="1")int member_phone){
		System.out.println("memberView 메서드 실행 확인  Member_Controller.java ");
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		return "/member/member_information_view";
		
	}
	
	//수정처리 화면 출력 메서드 
	@RequestMapping(value ="/member_update", method = RequestMethod.GET)
		public String update(Model model,@RequestParam(value="member_phone")int member_phone){
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
	public String memberDeletePage(Model model , @RequestParam(value="member_phone")int member_phone){
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		
		System.out.println("memberDeletePage 메서드 호출    Member_Controller.java");
		return "/member/member_Secede";
	}
	// 삭제처리 메서드
		@RequestMapping(value="/member_SecedeAction",method = RequestMethod.POST)
		public String memberDelete(@RequestParam(value="member_phone")int member_phone){
			System.out.println("memberDelete메서드 호출    Member_Controller.java");
			Mdao.deleteMember(member_phone);
			return "redirect:member_list";
		}
		
	

}
