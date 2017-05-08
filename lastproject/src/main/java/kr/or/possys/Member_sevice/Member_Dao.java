package kr.or.possys.Member_sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Member_Dao {

	@Autowired
	private SqlSessionTemplate Msql;
	
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
	public Member getMember(int phone){
		System.out.println("getMember 메서드 실행   Member_Dao.java ");
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.MselectOne", phone);
	}
	//수정처리 메서드
	public int Mupdate(Member m){
		System.out.println("Mupdate 메서드 실행 Member_Dao.java");
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.Mupdate",m);
	}
	//삭제처리 메서드
	public int deleteMember(int member_phone){
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
