package com.ticket.biz.exhibition;

public class ReviewVO {

	private int review_no;
	private int exh_no;
	private int review_score;
	private String review_cotent;
	private String review_img;
	private String review_reg_date;
	private String mb_id;


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
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_cotent() {
		return review_cotent;
	}
	public void setReview_cotent(String review_cotent) {
		this.review_cotent = review_cotent;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

}
