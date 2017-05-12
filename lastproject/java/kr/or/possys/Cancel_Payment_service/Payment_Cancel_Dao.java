package kr.or.possys.Cancel_Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Payment_service.Payment;

@Repository
public class Payment_Cancel_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// update, delete는 필요시에 구현한다.
	
	public Payment_Cancel getPaymentCancel(String payment_cancel_id) {
        return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancel", payment_cancel_id);
        
    }
 
    public List<Payment_Cancel> getPaymentCancelList(int currentPage, int pagePerRow) {
        System.out.println("getPaymentCancelList");
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	System.out.println(map);
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancelList", map);
    }
    
    public int getPaymentCancelCount() {
    	System.out.println("getPaymentCancelCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancelCount");
    }
 
    public int insertPaymentCancel(Payment_Cancel payment_cancel) {
    	System.out.println("insertPaymentCancel");
        return sqlSessionTemplate.insert("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.insertPaymentCancel", payment_cancel);
    }
}
