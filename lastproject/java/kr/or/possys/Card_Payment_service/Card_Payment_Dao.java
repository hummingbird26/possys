package kr.or.possys.Card_Payment_service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Card_Payment_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
		
		/*public int updatePayment(Payment Payment) {
	        return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment", payment_id);
	    }*/
	    
	    /*public int deletePayment(String payment_id, String payment_pw) {
	        Payment Payment = new Payment();
	        Payment.setPayment_id(payment_id);
	        Payment.setPayment_pw(payment_pw);
	        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
	    }*/
	    
	    public Card_Payment getCardPayment(String card_id) {
	    	System.out.println("getCardPayment");
	        return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPayment", card_id);
	        
	    }
	 
	    public List<Card_Payment> getCardPaymentList(int currentPage, int pagePerRow) {
	        Map<String, Integer> map = new HashMap<String, Integer>();
	        map.put("beginRow", (currentPage-1)*pagePerRow);
	        map.put("pagePerRow", pagePerRow);
	        return sqlSessionTemplate.selectList("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPaymentList", map);
	    }
	    
	    public int getCardPaymentCount() {
	        return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPaymentCount");
	    }
	 
	    public int insertCardPayment(Card_Payment card_payment) {
	        return sqlSessionTemplate.insert("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.insertCardPayment", card_payment);
	    }
}
