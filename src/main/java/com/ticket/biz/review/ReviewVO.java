package com.ticket.biz.review;

import java.sql.Timestamp;

public class ReviewVO {
	private int review_no;
	private int exh_no;
	private String review_writer;
	private String review_content;
	
	private Timestamp review_reg_date;
	
	private int review_bno;
	private int offset;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getExh_no() {
		return exh_no;
	}
	public void setExh_no(int exh_no) {
		this.exh_no = exh_no;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public Timestamp getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(Timestamp review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	
	public int getReview_bno() {
		return review_bno;
	}
	public void setReview_bno(int review_bno) {
		this.review_bno = review_bno;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", exh_no=" + exh_no + ", review_writer=" + review_writer
				+ ", review_content=" + review_content + ", review_reg_date=" + review_reg_date + ", review_bno="
				+ review_bno + ", offset=" + offset + "]";
	}
		

}
