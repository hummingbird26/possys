package kr.or.possys.Staff_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Staff_service.Staff;

@Repository
public class Staff_Dao {
	// Staff테이블에 맞게 DAO 수정하기.
	@Autowired
private SqlSessionTemplate sqlSessionTemplate;
	//직원 로그인 체크 메서드 
		public Staff loginSelect(String s){
			System.out.println("loginSelect 메서드 실행 Staff_Dao.java");

		
			return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.login", s);
		}
		
	public int updateStaff(Staff Staff) {
		System.out.println("updateStaff");
        return sqlSessionTemplate.update("kr.or.possys.Staff_service.Staff_Mapper.updateStaff", Staff);
    }
    
    public int deleteStaff(String staff_id, String staff_pw) {
    	System.out.println("deleteStaff");
        Staff Staff = new Staff();
        Staff.setStaff_id(staff_id);
        Staff.setStaff_pw(staff_pw);
        return sqlSessionTemplate.delete("kr.or.possys.Staff_service.Staff_Mapper.deleteStaff", Staff);
    }
    
    public Staff getStaff(String staff_id) {
    	System.out.println("getStaff");
        return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.getStaff", staff_id);
    }
 
    public List<Staff> getStaffList(int currentPage, int pagePerRow) {
    	System.out.println("getStaffList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Staff_service.Staff_Mapper.getStaffList", map);
    }
    
    public int getStaffCount(){
    	System.out.println("getStaffCount");
    	// 경로가 잘못 입력된 것을 미처 확인하지 못함
        return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.getStaffCount");
    }
 
    public int insertStaff(Staff Staff) {
    	System.out.println("insertStaff");
        return sqlSessionTemplate.insert("kr.or.possys.Staff_service.Staff_Mapper.insertStaff", Staff);
    }
    
    //직원코드 중복 메서드
    public int check_sid(String staff_id){
    	System.out.println("check_sid");
    	System.out.println(staff_id);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.check_sid", staff_id);
    }
}
