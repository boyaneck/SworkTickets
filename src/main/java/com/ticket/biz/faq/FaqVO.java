package com.ticket.biz.faq;

import java.util.Date;

public class FaqVO {

	private int faq_no;

	private String faq_title;
	private Date faq_reg;
	private String faq_content;
	private int offset;
	
	private String searchKeyword;


	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}



	public Date getFaq_reg() {
		return faq_reg;
	}
	public void setFaq_reg(Date faq_reg) {
		this.faq_reg = faq_reg;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	@Override
	public String toString() {
		return "FaqVO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_reg=" + faq_reg + ", faq_content="
				+ faq_content + ", offset=" + offset + ", searchKeyword=" + searchKeyword + "]";
	}


		



}