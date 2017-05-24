package kr.or.possys.Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;

@Repository
public class Payment_Dao {
	// Payment테이블에 맞게끔 DAO 새로 설정하기.
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*public int updatePayment(Payment Payment) {
        return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment", payment_id);
    }*/
    
	//결제목록삭제기능
    public int deletePayment(String payment_id) {
        Payment Payment = new Payment();
        Payment.setPayment_id(payment_id);
        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
    }
	
	// payment와 payment_cancel 연결
		public int PaymentCancel(Payment payment) {
	    	System.out.println("Payment_Cancel");
	        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.PaymentCancel", payment);
	    }
	
	//payment 결제 아이디 중복 체크
	public int check_pid(String payment_id) {
		System.out.println("check_pid");
		System.out.println(payment_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.check_pid", payment_id);
		
	}
	
	//Payment 테이블주문아이디 중복체크
	public int checkToid(String table_order_id){
		System.out.println("checkToid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkToid", table_order_id);
	}
	
	//Payment 회원전화번호 중복체크
		public int checkPMPhone(String member_phone){
			System.out.println("checkPMPhone");
			System.out.println(member_phone);
			
			return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkPMPhone", member_phone);
		}
	
    //payment 검색 수 요청
    public int paymentSRlist(String select, String keyWord){
    	System.out.println("paymentSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.paymentSRlist",map);
    }

    //payment 검색요청
	public List<Payment> paymentSRsearch(String select,String keyWord, int currentPage, int pagePerRow){
		System.out.println("paymentSRsearch");
		System.out.println(select);
		System.out.println(keyWord);
		System.out.println(currentPage);
		System.out.println(pagePerRow);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("select", select);
		map.put("keyWord", keyWord);
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		System.out.println(map.get("select"));
		System.out.println(map.get("keyWord"));
		System.out.println(map.get("beginRow"));
		System.out.println(map.get("pagePerRow"));
		
		//selectOne이 아닌 selectList 메서드가 실행되어야 일단 화면이라도 잘 넘어가진다.
		//리턴타입이 리스트인데 정작 리턴을 selectList가 아니라 한 레코드의 값만 받는 selectOne으로 하고 있었으니..
		return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.paymentSRsearch",map);
	}
	
	
	//payment 리스트에서 view를 보기 위해서 기본키 값 요청
    public Payment getPayment(String payment_id) {
    	System.out.println("getPayment");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    //payment 목록요청
    public List<Payment> getPaymentList(int currentPage, int pagePerRow) {
    	System.out.println("getPaymentList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.getPaymentList", map);
    }
    
    //payment 목록 갯수 카운트
    public int getPaymentCount() {
    	System.out.println("getPaymentCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPaymentCount");
    }
    
    //payment 입력요청
    public int insertPayment(Payment Payment) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPayment", Payment);
    }

}