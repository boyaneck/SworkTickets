package com.ticket.biz.review;

import java.sql.Timestamp;

public class ReviewVO {
	private int review_no;
	private int review_bno;
	private String review_writer;
	private String review_content;

	private String re_review;
	private int review_type;
	private Timestamp review_reg;






	public int getReview_bno() {
		return review_bno;
	}
	public void setReview_bno(int review_bno) {
		this.review_bno = review_bno;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	public String getRe_review() {
		return re_review;
	}
	public void setRe_review(String re_review) {
		this.re_review = re_review;
	}
	public int getReview_type() {
		return review_type;
	}
	public void setReview_type(int review_type) {
		this.review_type = review_type;
	}
	public Timestamp getReview_reg() {
		return review_reg;
	}
	public void setReview_reg(Timestamp review_reg) {
		this.review_reg = review_reg;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", review_bno=" + review_bno + ", review_writer=" + review_writer
				+ ", review_content=" + review_content + ", re_review=" + re_review + ", review_type=" + review_type
				+ ", review_reg=" + review_reg + "]";
	}


}
