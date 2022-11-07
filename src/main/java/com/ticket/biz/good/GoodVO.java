package com.ticket.biz.good;

import org.springframework.beans.factory.annotation.Autowired;

import com.ticket.biz.exhibition.ExhibitionVO;

public class GoodVO {
	private int good_id; //좋아요 번호
	private int good_check;//체크
	private String mb_id;//사용자아아디
	private int exh_no;//전시아이디
	
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getGood_id() {
		return good_id;
	}

	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getExh_no() {
		return exh_no;
	}

	public void setExh_no(int exh_no) {
		this.exh_no = exh_no;
	}

	@Override
	public String toString() {
		return "GoodVO [good_id=" + good_id + ", mb_id=" + mb_id + ", exh_no=" + exh_no + ", cnt=" + cnt + "]";
	}

	public void setOffset(int offset) {
		// TODO Auto-generated method stub
		
	}



}
	
