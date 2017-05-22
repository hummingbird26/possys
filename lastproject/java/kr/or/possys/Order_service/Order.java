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
	
	private String food_id;
	private String fpm_ea;
	private String food_unit;
	
	private String ep_order_id;
	private String ep_order_shelflife;
	private String food_nowquantity;
	
	private int total_use;
	private int food_now;
	private int food_sum;
	
	
	
	
	
	
	public int getTotal_use() {
		return total_use;
	}
	public void setTotal_use(int total_use) {
		this.total_use = total_use;
	}
	public int getFood_now() {
		return food_now;
	}
	public void setFood_now(int food_now) {
		this.food_now = food_now;
	}
	public int getFood_sum() {
		return food_sum;
	}
	public void setFood_sum(int food_sum) {
		this.food_sum = food_sum;
	}
	public String getEp_order_id() {
		return ep_order_id;
	}
	public void setEp_order_id(String ep_order_id) {
		this.ep_order_id = ep_order_id;
	}
	public String getEp_order_shelflife() {
		return ep_order_shelflife;
	}
	public void setEp_order_shelflife(String ep_order_shelflife) {
		this.ep_order_shelflife = ep_order_shelflife;
	}
	public String getFood_nowquantity() {
		return food_nowquantity;
	}
	public void setFood_nowquantity(String food_nowquantity) {
		this.food_nowquantity = food_nowquantity;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getFpm_ea() {
		return fpm_ea;
	}
	public void setFpm_ea(String fpm_ea) {
		this.fpm_ea = fpm_ea;
	}
	public String getFood_unit() {
		return food_unit;
	}
	public void setFood_unit(String food_unit) {
		this.food_unit = food_unit;
	}
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
