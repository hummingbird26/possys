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
	
	public Payment getPayment(String payment_id) {
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    public List<Payment_Cancel> getPaymentCancelList(int currentPage, int pagePerRow) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_Cancel_service.Payment_Cancel_Mapper.getPaymentCancelList", map);
    }
    
    public int getPaymentCancelCount() {
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_Cancel_service.Payment_Cancel_Mapper.getPaymentCancelCount");
    }
 
    public int insertCancelPayment(Payment_Cancel Payment_Cancel) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_Cancel_service.Payment_Cancel_Mapper.insertCancelPayment", Payment_Cancel);
    }
}
