package com.ticket.biz.member;

public class NaverVO {

	//네이버 정보
	private String client_id = "FvqDU_EOG1povZWb2YP6";
	private String service_url = "http://newjeonsis.ml/index";
	private String callback_url = "http://newjeonsis.ml";
	private String client_secret = "cisI7m8b8z";
	
	
	//로컬호스트
//	private String client_id = "Ufl_yap8C4lhpikzFVu0";
//	private String service_url = "http://localhost:8090/index";
//	private String callback_url = "http://localhost:8090";
//	private String client_secret = "TEnPKtM2MT";
	
	
//	private String client_id = "WUxQD9ADxsDv22L8muAv";
//	private String service_url = "http://hmticket.ml/index";
//	private String callback_url = "http://hmticket.ml";
//	private String client_secret = "N7KLebYj0V";



	// 네이버 로그인 연동 결과 Callback 정보
	private String code;
	private String state;


	//접근토근 요청/응답정보
	private String grant_type;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private int expires_in;


	//공통 - 연동결과 응답정보, 접근토근 응답정보
	private String error;
	private String error_description;

	private int inout;



	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getService_url() {
		return service_url;
	}
	public void setService_url(String service_url) {
		this.service_url = service_url;
	}
	public String getCallback_url() {
		return callback_url;
	}
	public void setCallback_url(String callback_url) {
		this.callback_url = callback_url;
	}
	public String getClient_secret() {
		return client_secret;
	}
	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGrant_type() {
		return grant_type;
	}
	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}
	public String getToken_type() {
		return token_type;
	}
	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}
	public int getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getError_description() {
		return error_description;
	}
	public void setError_description(String error_description) {
		this.error_description = error_description;
	}
	public int getInout() {
		return inout;
	}
	public void setInout(int inout) {
		this.inout = inout;
	}




}
