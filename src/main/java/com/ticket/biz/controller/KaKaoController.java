package com.ticket.biz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ticket.biz.member.KakaoVO;
import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;

@Controller
public class KaKaoController {

	@Autowired
	private MemberService memberService;

	public static final String KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
	public static final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	public static final String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
	public static final String KAKAO_LOGOUT_URL = "https://kapi.kakao.com/v1/user/logout";
	public static final String KAKAO_UNLINK_URL = "https://kapi.kakao.com/v1/user/unlink";
	private static String id;
	public String REDIRECT_URI = "";

	@RequestMapping("/getAuthUrl")
//	@ResponseBody
	public String getToken(KakaoVO vo) {
		REDIRECT_URI = vo.getREDIRECT_URI() + "/getToken";
		String result = KAKAO_AUTH_URL + "?response_type=code&scope=account_email,gender,profile_nickname&client_id="
				+ vo.getREST_API_KEY() + "&redirect_uri=" + REDIRECT_URI;

		System.out.println(result);
		return "redirect:" + result;
	}

	/*
	 * 토큰가져오기 소셜로그인을통한 DB저장까지
	 */
	@RequestMapping(value = "/getToken")
	public String oauthKakao(KakaoVO vo, Model model, HttpSession session, MemberVO member) throws Exception {
		System.out.println("code: " + vo.getCode());
		String access_Token = getAccessToken(vo.getCode());
		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		
//        System.out.println("access_Token : " + access_Token);
		String id = (String) userInfo.get("id");
		String email = (String) userInfo.get("email");
		String nickname = (String) userInfo.get("nickname");
//        System.out.println("userInfo : " + userInfo.get("email"));
//        System.out.println("nickname : " + userInfo.get("nickname"));
		member.setMb_id(id);
		member.setMb_email(email);
		member.setMb_name(nickname);
		model.addAttribute("kakaoInfo", userInfo);
		session.setAttribute("mb_Id", userInfo.get("id"));
		if (member.getMb_id() != null) {
			memberService.insertMember(member);
		} else {
			System.out.println("테스트");
			return "redirect:index.jsp";
		}

		REDIRECT_URI = "http://newjeonsis.ml";
		return "redirect:index.jsp";
	}

	// 카카오 로그아웃
	@RequestMapping(value = "/logout")
	public String logoutKakao(KakaoVO vo) throws Exception {
		System.out.println("id: " + id);
		String addURL = "?target_id_type=user_id&target_id=" + id;
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_LOGOUT_URL + addURL);
		get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY());

		HttpResponse res = client.execute(get);
		ObjectMapper mapper = new ObjectMapper();
		String body = EntityUtils.toString(res.getEntity());
		System.out.println("body111: " + body);

		return "redirect:/unlinkKakao";
	}

	// 카카오 계정 끊기
	@RequestMapping(value = "/unlinkKakao")
	public String unlinkKakao(KakaoVO vo, Model model) {
		System.out.println("id: " + id);
		String addURL = "?target_id_type=user_id&target_id=" + id;
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_UNLINK_URL + addURL);
		get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY());
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			System.out.println("body333: " + body);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/home";
	}

//	@RequestMapping("/logOutUrl")
//	@ResponseBody
//	public String getLogout() {
//		REDIRECT_URI = REDIRECT_URI+"/logout";
//		String result = KAKAO_AUTH_URL + "?response_type=code&client_id="+REST_API_KEY+"&redirect_uri="+REDIRECT_URI;
////		REDIRECT_URI = "http://localhost:8090";
//		return result;
//	}
//
//	//리다이렉트 로그아웃
//	@RequestMapping(value = "/logout")
//	public String logoutKakao(
//			@RequestParam(value = "code", required = false) String code, HttpServletResponse response
//			, Model model) throws Exception {
//		System.out.println("code: " + code);
//        String access_Token = getAccessToken(code);
//
//        HttpClient client = HttpClientBuilder.create().build();
//		HttpGet get = new HttpGet(KAKAO_LOGOUT_URL);
//		HashMap<String, Object> map = new HashMap<>();
//		get.setHeader("Authorization", "Bearer " + access_Token);
//		try {
//			HttpResponse res = client.execute(get);
//			ObjectMapper mapper = new ObjectMapper();
//			String body = EntityUtils.toString(res.getEntity());
//			System.out.println("body333: "+body);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		REDIRECT_URI = "http://localhost:8090";
//        return "redirect:index.jsp";
//	}

//	//토큰발급
//	public String getAccessToken(String authorize_code) {
//		System.out.println("authorize_code: " + authorize_code);
//
//		String result = "";
//		HttpClient client = HttpClientBuilder.create().build();
//		HttpPost post = new HttpPost(KAKAO_TOKEN_URL);
//		Map<String,String> m =new HashMap<>();
//		m.put("grant_type", "authorization_code");
//		m.put("client_id", REST_API_KEY);
//		m.put("redirect_uri", REDIRECT_URI);
//		m.put("code", authorize_code);
//		try {
//			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
//			HttpResponse res = client.execute(post);
//			ObjectMapper mapper = new ObjectMapper();
//			String body = EntityUtils.toString(res.getEntity());
//			JsonNode rootNode = mapper.readTree(body);
//			result = rootNode.get("access_token").asText();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		REDIRECT_URI = "http://localhost:8090";
//        return result;
//	}
	// 토큰발급
	public String getAccessToken(String authorize_code) {
		KakaoVO vo = new KakaoVO();
		System.out.println("authorize_code: " + authorize_code);
		REDIRECT_URI = vo.getREDIRECT_URI() + "/getToken";

		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(KAKAO_TOKEN_URL);
		Map<String, String> m = new HashMap<>();
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getREST_API_KEY());
		m.put("redirect_uri", REDIRECT_URI);
		m.put("code", authorize_code);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			result = rootNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	// 유저정보조회
	public HashMap<String, Object> getUserInfo(String access_Token) {
		System.out.println("access_Token: " + access_Token);
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_USER_INFO_URL);
		HashMap<String, Object> map = new HashMap<>();
		get.setHeader("Authorization", "Bearer " + access_Token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());

			System.out.println("바디: " + body);

			JsonNode rootNode = mapper.readTree(body);
			if (rootNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg", "내역이 없습니다.");
			} else {
				System.out.println("엘즈문: " + body);
				map.put("msg", "ok");
				map.put("id", rootNode.get("id").asText());
				map.put("access_Token", access_Token);
				map.put("connected_at", rootNode.get("connected_at").asText());
				map.put("nickname", rootNode.get("properties").get("nickname").asText());
				map.put("email", rootNode.get("kakao_account").get("email").asText());
//				map.put("gender",rootNode.get("kakao_account").get("gender").asText());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value = { "/login/kakao" })
	public String home() {
		System.out.println("컨트롤러");
		return "views/login_kakao";
	}
}
