package com.ticket.biz.one;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class OneVO {

	private int one_no;
	private String one_title;
	private String one_writer;
	private String one_content;
	private Date one_date;
	private String one_category;
	private Date one_modify;

	private String searchCondition;
	private String searchKeyword;



	private MultipartFile uploadFile;
	private String filename;

	private int offset;

	private boolean one_secret;


	public boolean isOne_secret() {
		return one_secret;
	}
	public void setOne_secret(boolean one_secret) {
		this.one_secret = one_secret;
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
	public String getOne_category() {
		return one_category;
	}
	public void setOne_category(String one_category) {
		this.one_category = one_category;
	}
	public int getOne_no() {
		return one_no;
	}
	public void setOne_no(int one_no) {
		this.one_no = one_no;
	}
	public String getOne_title() {
		return one_title;
	}
	public void setOne_title(String one_title) {
		this.one_title = one_title;
	}
	public String getOne_writer() {
		return one_writer;
	}
	public void setOne_writer(String one_writer) {
		this.one_writer = one_writer;
	}
	public String getOne_content() {
		return one_content;
	}
	public void setOne_content(String one_content) {
		this.one_content = one_content;
	}
	public Date getOne_date() {
		return one_date;
	}
	public void setOne_date(Date one_date) {
		this.one_date = one_date;
	}

	public Date getOne_modify() {
		return one_modify;
	}
	public void setOne_modify(Date one_modify) {
		this.one_modify = one_modify;
	}



}
