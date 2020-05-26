package com.po;
/**
 * 管理员实体类
 * @author Administrator
 *
 */
public class Manager {
	
	private String mg_id;
	private String mg_password;
	private String mg_name;
	private String mg_status;
	private String mg_sex;
	private String mg_level;
	private String mg_phone;
	public String getMg_id() {
		return mg_id;
	}
	public void setMg_id(String mg_id) {
		this.mg_id = mg_id;
	}
	public String getMg_password() {
		return mg_password;
	}
	public void setMg_password(String mg_password) {
		this.mg_password = mg_password;
	}
	public String getMg_name() {
		return mg_name;
	}
	public void setMg_name(String mg_name) {
		this.mg_name = mg_name;
	}
	public String getMg_status() {
		return mg_status;
	}
	public void setMg_status(String mg_status) {
		this.mg_status = mg_status;
	}
	public String getMg_sex() {
		return mg_sex;
	}
	public void setMg_sex(String mg_sex) {
		this.mg_sex = mg_sex;
	}
	public String getMg_level() {
		return mg_level;
	}
	public void setMg_level(String mg_level) {
		this.mg_level = mg_level;
	}
	public String getMg_phone() {
		return mg_phone;
	}
	public void setMg_phone(String mg_phone) {
		this.mg_phone = mg_phone;
	}
	@Override
	public String toString() {
		return "Manager [mg_id=" + mg_id + ", mg_password=" + mg_password + ", mg_name=" + mg_name + ", mg_sex="
				+ mg_sex + ", mg_level=" + mg_level + ", mg_phone=" + mg_phone + "]";
	}
	
	
}
