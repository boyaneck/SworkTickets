package com.ticket.biz.faq;

import java.util.Date;

public class FaqVO {

	private int faq_no;

	private String faq_title;
	private String cate_name;
	private Date faq_reg;
	private String faq_content;
	private int offset;


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
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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
		return "FaqVO [faq_title=" + faq_title + ", cate_name=" + cate_name + ", faq_reg=" + faq_reg + ", faq_content="
				+ faq_content + ", offset=" + offset + "]";
	}




}