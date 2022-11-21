package com.ticket.biz.member;

public class KakaoVO {
	private String REDIRECT_URI = "http://newjeonsis.ml";
	private String REST_API_KEY = "4261ff490e85bca326e55849230898ef";
	private String ADMIN_KEY = "6463140455b8d45caf00afb3bff98247";
	private String code;


	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getREDIRECT_URI() {
		return REDIRECT_URI;
	}
	public void setREDIRECT_URI(String rEDIRECT_URI) {
		REDIRECT_URI = rEDIRECT_URI;
	}
	public String getREST_API_KEY() {
		return REST_API_KEY;
	}
	public void setREST_API_KEY(String rEST_API_KEY) {
		REST_API_KEY = rEST_API_KEY;
	}
	public String getADMIN_KEY() {
		return ADMIN_KEY;
	}
	public void setADMIN_KEY(String aDMIN_KEY) {
		ADMIN_KEY = aDMIN_KEY;
	}
}
