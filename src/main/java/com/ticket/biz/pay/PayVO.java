package com.ticket.biz.pay;

public class PayVO {
	private String p_id;//결제고유ID
	private String p_mer;//상점거래ID
	private String mb_id;//회원아이디
	private String p_date;//결제 일시
	private String buyer;//주문자
	private String buyer_email;//주문자이메일
	private String buyer_tel;//주문자 연락처
	private String exh_title;//전시명
	private int amount;//가격



	public String getExh_title() {
		return exh_title;
	}
	public void setExh_title(String exh_title) {
		this.exh_title = exh_title;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_mer() {
		return p_mer;
	}
	public void setP_mer(String p_mer) {
		this.p_mer = p_mer;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	@Override
	public String toString() {
		return "PayVO [p_id=" + p_id + ", p_mer=" + p_mer + ", mb_id=" + mb_id + ", p_date=" + p_date + ", buyer="
				+ buyer + ", buyer_email=" + buyer_email + ", buyer_tel=" + buyer_tel + ", exh_title=" + exh_title
				+ ", amount=" + amount + "]";
	}



}
