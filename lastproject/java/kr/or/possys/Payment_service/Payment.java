package kr.or.possys.Payment_service;

public class Payment {

	private String payment_id;
	private String table_order_id;
	private String member_phone;
	private int payment_total;
	private int payment_pay;
	private int payment_addmileage;
	private int payment_usemileage;
	private String payment_date;
	private String payment_cate;
	private String payment_state;
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getTable_order_id() {
		return table_order_id;
	}
	public void setTable_order_id(String table_order_id) {
		this.table_order_id = table_order_id;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getPayment_total() {
		return payment_total;
	}
	public void setPayment_total(int payment_total) {
		this.payment_total = payment_total;
	}
	public int getPayment_pay() {
		return payment_pay;
	}
	public void setPayment_pay(int payment_pay) {
		this.payment_pay = payment_pay;
	}
	public int getPayment_addmileage() {
		return payment_addmileage;
	}
	public void setPayment_addmileage(int payment_addmileage) {
		this.payment_addmileage = payment_addmileage;
	}
	public int getPayment_usemileage() {
		return payment_usemileage;
	}
	public void setPayment_usemileage(int payment_usemileage) {
		this.payment_usemileage = payment_usemileage;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_cate() {
		return payment_cate;
	}
	public void setPayment_cate(String payment_cate) {
		this.payment_cate = payment_cate;
	}
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Payment [payment_id=" + payment_id + ", table_order_id=" + table_order_id + ", member_phone=" + member_phone
				+ ", payment_total=" + payment_total + ", payment_pay=" + payment_pay + ", payment_addmileage=" + payment_addmileage
				+ ", payment_usemileage=" + payment_usemileage + ", payment_date=" + payment_date + ", payment_cate=" + payment_cate
				+ ", payment_state=" + payment_state +"]";
				
	}
	
	
}
