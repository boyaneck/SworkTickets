package com.ticket.biz.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	private int noti_no;
	private String noti_title;
	private String noti_writer;
	private String noti_content;
	private Date noti_date;
	private String noti_category;
	private Date noti_modify;

	private String searchCondition;
	private String searchKeyword;



	private MultipartFile uploadFile;
	private String filename;

	private int offset;

	private boolean noti_secret;


	public boolean isNoti_secret() {
		return noti_secret;
	}
	public void setNoti_secret(boolean noti_secret) {
		this.noti_secret = noti_secret;
	}


	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getNoti_category() {
		return noti_category;
	}
	public void setNoti_category(String noti_category) {
		this.noti_category = noti_category;
	}
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_writer() {
		return noti_writer;
	}
	public void setNoti_writer(String noti_writer) {
		this.noti_writer = noti_writer;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}

	public Date getNoti_modify() {
		return noti_modify;
	}
	public void setNoti_modify(Date noti_modify) {
		this.noti_modify = noti_modify;
	}



}
