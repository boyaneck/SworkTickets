package com.ticket.biz.couponbox;

import com.ticket.biz.coupon.CouponVO;

public class CouponBoxVO {
	private int cb_id;
	private String c_num;
	private String mb_id;
	private int cb_check;

	private String searchCondition;
	private String searchKeyword;

	private int offset;

	private CouponVO couponvo;



	public CouponVO getCouponvo() {
		return couponvo;
	}
	public void setCouponvo(CouponVO couponvo) {
		this.couponvo = couponvo;
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
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}

	public String getC_num() {
		return c_num;
	}
	public void setC_num(String c_num) {
		this.c_num = c_num;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCb_check() {
		return cb_check;
	}
	public void setCb_check(int cb_check) {
		this.cb_check = cb_check;
	}



}
