package kr.or.possys.Order_service;

import org.springframework.web.multipart.MultipartFile;

public class Order {
	
	private String table_order_id;
	private int table_order_num;
	private String table_order_end;
	private String table_order_date;
	private String menu_id;
	private String menu_name;
	
	private String order_detail_ea;
	private String order_detail_sum;
	private String menu_price;
	
	private String orgname;
	private String newname;
	
	private MultipartFile order_file;
	
	


	public MultipartFile getOrder_file() {
		return order_file;
	}
	public void setOrder_file(MultipartFile order_file) {
		this.order_file = order_file;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getNewname() {
		return newname;
	}
	public void setNewname(String newname) {
		this.newname = newname;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getOrder_detail_ea() {
		return order_detail_ea;
	}
	public void setOrder_detail_ea(String order_detail_ea) {
		this.order_detail_ea = order_detail_ea;
	}
	public String getOrder_detail_sum() {
		return order_detail_sum;
	}
	public void setOrder_detail_sum(String order_detail_sum) {
		this.order_detail_sum = order_detail_sum;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getTable_order_id() {
		return table_order_id;
	}
	public void setTable_order_id(String table_order_id) {
		this.table_order_id = table_order_id;
	}
	public int getTable_order_num() {
		return table_order_num;
	}
	public void setTable_order_num(int table_order_num) {
		this.table_order_num = table_order_num;
	}
	public String getTable_order_end() {
		return table_order_end;
	}
	public void setTable_order_end(String table_order_end) {
		this.table_order_end = table_order_end;
	}
	public String getTable_order_date() {
		return table_order_date;
	}
	public void setTable_order_date(String table_order_date) {
		this.table_order_date = table_order_date;
	}

}
