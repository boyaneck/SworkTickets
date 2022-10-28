package com.ticket.biz.exhibition;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ExhibitionVO {
	
	private int exh_no;
	private String exh_title;
	private int exh_price;
	private Date exh_st_date; 
	private Date exh_end_date; 
	private Date exh_rge_date; 
	private Date exh_mdf_date; 
	private String exh_location;
	private String exh_hall;
	private String exh_content;
	private String exh_img;
	private String exh_planner;
	private String exh_time;
	private String exh_rating;
	private String exh_artist;
	private float exh_place_x;
	private float exh_place_y;
	private String exh_local_name;
	
	private String searchKeyword;
	
	private MultipartFile uploadFile;	
	
	private int offset;

	
	private int exh_common_no;
	private String exh_cs_phone;
	private int exh_fee;
	private String exh_shipping_info;
	private String exh_period_use;
	private String exh_refund_info;
	
	
	public int getExh_common_no() {
		return exh_common_no;
	}
	public void setExh_common_no(int exh_common_no) {
		this.exh_common_no = exh_common_no;
	}
	public String getExh_cs_phone() {
		return exh_cs_phone;
	}
	public void setExh_cs_phone(String exh_cs_phone) {
		this.exh_cs_phone = exh_cs_phone;
	}
	public int getExh_fee() {
		return exh_fee;
	}
	public void setExh_fee(int exh_fee) {
		this.exh_fee = exh_fee;
	}
	public String getExh_shipping_info() {
		return exh_shipping_info;
	}
	public void setExh_shipping_info(String exh_shipping_info) {
		this.exh_shipping_info = exh_shipping_info;
	}
	public String getExh_period_use() {
		return exh_period_use;
	}
	public void setExh_period_use(String exh_period_use) {
		this.exh_period_use = exh_period_use;
	}
	public String getExh_refund_info() {
		return exh_refund_info;
	}
	public void setExh_refund_info(String exh_refund_info) {
		this.exh_refund_info = exh_refund_info;
	}

	
	
	public int getExh_no() {
		return exh_no;
	}

	public void setExh_no(int exh_no) {
		this.exh_no = exh_no;
	}

	public String getExh_title() {
		return exh_title;
	}

	public void setExh_title(String exh_title) {
		this.exh_title = exh_title;
	}

	public int getExh_price() {
		return exh_price;
	}

	public void setExh_price(int exh_price) {
		this.exh_price = exh_price;
	}

	public Date getExh_st_date() {
		return exh_st_date;
	}

	public void setExh_st_date(Date exh_st_date) {
		this.exh_st_date = exh_st_date;
	}

	public Date getExh_end_date() {
		return exh_end_date;
	}

	public void setExh_end_date(Date exh_end_date) {
		this.exh_end_date = exh_end_date;
	}

	public Date getExh_rge_date() {
		return exh_rge_date;
	}

	public void setExh_rge_date(Date exh_rge_date) {
		this.exh_rge_date = exh_rge_date;
	}

	public Date getExh_mdf_date() {
		return exh_mdf_date;
	}

	public void setExh_mdf_date(Date exh_mdf_date) {
		this.exh_mdf_date = exh_mdf_date;
	}

	public String getExh_location() {
		return exh_location;
	}

	public void setExh_location(String exh_location) {
		this.exh_location = exh_location;
	}

	public String getExh_hall() {
		return exh_hall;
	}

	public void setExh_hall(String exh_hall) {
		this.exh_hall = exh_hall;
	}

	public String getExh_content() {
		return exh_content;
	}

	public void setExh_content(String exh_content) {
		this.exh_content = exh_content;
	}

	public String getExh_img() {
		return exh_img;
	}

	public void setExh_img(String exh_img) {
		this.exh_img = exh_img;
	}

	public String getExh_planner() {
		return exh_planner;
	}

	public void setExh_planner(String exh_planner) {
		this.exh_planner = exh_planner;
	}

	public String getExh_time() {
		return exh_time;
	}

	public void setExh_time(String exh_time) {
		this.exh_time = exh_time;
	}

	public String getExh_rating() {
		return exh_rating;
	}

	public void setExh_rating(String exh_rating) {
		this.exh_rating = exh_rating;
	}

	public String getExh_artist() {
		return exh_artist;
	}

	public void setExh_artist(String exh_artist) {
		this.exh_artist = exh_artist;
	}

	public float getExh_place_x() {
		return exh_place_x;
	}

	public void setExh_place_x(float exh_place_x) {
		this.exh_place_x = exh_place_x;
	}

	public float getExh_place_y() {
		return exh_place_y;
	}

	public void setExh_place_y(float exh_place_y) {
		this.exh_place_y = exh_place_y;
	}

	public String getExh_local_name() {
		return exh_local_name;
	}

	public void setExh_local_name(String exh_local_name) {
		this.exh_local_name = exh_local_name;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
}
