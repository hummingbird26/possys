package kr.or.possys.Member_sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Payment_service.Payment;


@Repository
public class Member_Dao {

	@Autowired
	private SqlSessionTemplate Msql;
	
	public List<Order> table_state(){
		System.out.println("table_state 메서드 실행 확인 Member_Dao.java");
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_state");
	}
	//테이블 클릭시 주문내역 확인 메서드
	public List<Order> table_Order_detail(String table_order_num){
		System.out.println("table_Order_detail 메서드 실행 확인 Member_dao.java");
		System.out.println(table_order_num+"<<<<<<<<<<<<");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_Order_detail", table_order_num);
		
	}
	
	//매출현황 카드별 조회 메서드(취소)
	public List<Payment_Cancel> C_CDcatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_CDcatePayment 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_CDcatePayment", map);
		
	}

	//매출현황 현금 별 조회 메서드(취소)
	public List<Payment_Cancel> C_McatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_McatePayment 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_McatePayment", map);
		
	}
	
	//매출현황 조회 메서드(취소)
	public List<Payment_Cancel> C_totalPaymentList(String selbox){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("selbox", selbox);
	System.out.println("C_totalPaymentList 메서드 실행 확인 Member_Dao.java");
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_totalPaymentList", map);
	
	}
	
	//매출현황 카드별 조회 메서드
			public List<Payment> CDcatePayment(String selbox){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("selbox", selbox);
				System.out.println("CDcatePayment 메서드 실행 확인 Member_Dao.java");
				return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.CDcatePayment", map);
				
			}
		
	//매출현황 현금 별 조회 메서드
		public List<Payment> McatePayment(String selbox){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("selbox", selbox);
			System.out.println("McatePayment 메서드 실행 확인 Member_Dao.java");
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.McatePayment", map);
			
		}
	
	//매출현황 조회 메서드
	public List<Payment> totalPaymentList(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("totalPaymentList 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.totalPaymentList", map);
		
	}
	
	
	//실시간 회원 조회 메서드
	public List<Member> AjaxMemberList(int currentPage, int pagePerRow ,String insert){
		System.out.println("getMemberList 메서드 실행   Member_Dao.java ");
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("insert", insert);
        
        System.out.println(map.get("insert")+"입력값 AjaxMemberList Member_Dao");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.AjaxMemberList", map);
		
	}
	
	
	//회원 숫자 카운트 메서드
	public int getMemberCount(){
		System.out.println("getMemberCount 메서드 실행   Member_Dao.java ");
		
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getMemberCount");
		}
	//전체회원 조회 메서드
	public List<Member> getMemberList(int currentPage, int pagePerRow){
		System.out.println("getMemberList 메서드 실행   Member_Dao.java ");
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.getMemberList", map);
		
	}
	//한명 회원정보 조회 메서드
	public Member getMember(String member_phone){
		System.out.println("getMember 메서드 실행   Member_Dao.java ");
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.MselectOne", member_phone);
	}
	//수정처리 메서드
	public int Mupdate(Member m){
		System.out.println("Mupdate 메서드 실행 Member_Dao.java");
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.Mupdate",m);
	}
	//삭제처리 메서드
	public int deleteMember(String member_phone){
		System.out.println("deleteMember 메서드 실행 Member_Dao.java");
		
		return Msql.delete("kr.or.possys.Member_sevice.Member_Mapper.deleteMember", member_phone);
		
	}
	//검색처리 메서드(검색후 결과를 배열로 리스트처럼 보여줌)
	public List<Member> searchMember(String selBox,String search,int currentPage,int pagePerRow){
		System.out.println("selectMember 메서드 실행 Member_Dao.java");
		mVo m = new mVo();
		m.setSelBox(selBox);
		m.setSearch(search);
		m.setBeginRow((currentPage-1)*pagePerRow);
		m.setPagePerRow(pagePerRow);
		System.out.println(m.getSelBox()+"<----------------선택한값");
		System.out.println(m.getSearch()+"<----------------선택한값");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.Msearch",m);
	}
	//검색 조건에 맞는 회원수 조회 메서드
		public int getsearchCount(String selBox,String search){
			System.out.println("getsearchCount 메서드 실행   Member_Dao.java ");
			mVo m = new mVo();
			m.setSelBox(selBox);
			m.setSearch(search);
			
			return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getsearchCount",m);
			}

}
