package kr.or.possys.Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Order_service.Order;

@Repository
public class Payment_Dao {
	// Payment���̺� �°Բ� DAO ���� �����ϱ�.
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*public int updatePayment(Payment Payment) {
        return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment", payment_id);
    }*/
    
	public int bringOrderList(String table_order_id){
		System.out.println("bringOrderList");
		System.out.println(table_order_id);
		Map<String, Object> map = new HashMap<String, Object>();
		Order order = new Order();
		System.out.println(map);
		System.out.println(order);
    	map.put("table_order_id", table_order_id);
    	System.out.println(map);
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.bringOrderList",table_order_id);
	}
	
	//������ϻ������
    public int deletePayment(String payment_id) {
        Payment Payment = new Payment();
        Payment.setPayment_id(payment_id);
        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
    }
	
	// payment�� payment_cancel ����
		public int PaymentCancel(Payment payment) {
	    	System.out.println("Payment_Cancel");
	        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.PaymentCancel", payment);
	    }
	
	//payment ���� ���̵� �ߺ� üũ
	public int check_pid(String payment_id) {
		System.out.println("check_pid");
		System.out.println(payment_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.check_pid", payment_id);
		
	}
	
	//Payment ���̺��ֹ����̵� �ߺ�üũ
	public int checkToid(String table_order_id){
		System.out.println("checkToid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkToid", table_order_id);
	}
	
	//Payment ȸ����ȭ��ȣ �ߺ�üũ
		public int checkPMPhone(String member_phone){
			System.out.println("checkPMPhone");
			System.out.println(member_phone);
			
			return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkPMPhone", member_phone);
		}
	
    //payment �˻� �� ��û
    public int paymentSRlist(String select, String keyWord){
    	System.out.println("paymentSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.paymentSRlist",map);
    }

    //payment �˻���û
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
		
		//selectOne�� �ƴ� selectList �޼��尡 ����Ǿ�� �ϴ� ȭ���̶� �� �Ѿ����.
		//����Ÿ���� ����Ʈ�ε� ���� ������ selectList�� �ƴ϶� �� ���ڵ��� ���� �޴� selectOne���� �ϰ� �־�����..
		return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.paymentSRsearch",map);
	}
	
	
	//payment ����Ʈ���� view�� ���� ���ؼ� �⺻Ű �� ��û
    public Payment getPayment(String payment_id) {
    	System.out.println("getPayment");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    //payment ��Ͽ�û
    public List<Payment> getPaymentList(int currentPage, int pagePerRow) {
    	System.out.println("getPaymentList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.getPaymentList", map);
    }
    
    //payment ��� ���� ī��Ʈ
    public int getPaymentCount() {
    	System.out.println("getPaymentCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPaymentCount");
    }
    
    //payment �Է¿�û
    public int insertPayment(Payment Payment) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPayment", Payment);
    }

}