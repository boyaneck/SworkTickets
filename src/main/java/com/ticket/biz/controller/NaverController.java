package com.ticket.biz.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;
import com.ticket.biz.member.NaverVO;

@Controller
@SessionAttributes("naverLogin")
public class NaverController {
	@Autowired
	private MemberService memberService;

	private static final String NAVER_AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
	private static final String NAVER_TOKEN_URL = "https://nid.naver.com/oauth2.0/token";
	private static final String NAVER_PROFIL_URL = "https://openapi.naver.com/v1/nid/me";
	private static final String NAVER_LOGOUT_URL = "https://nid.naver.com/nidlogin.logout";

	private String REDIRECT_URL = "";
	private static String tokenChk;

	@RequestMapping(value = { "/login/naver" })
	public String naverLoginView(Model model, NaverVO vo) {
		model.addAttribute("naver", vo);
		return "views/login_naver";
	}

	@RequestMapping("/getNaverAuthUrl")
	public String getAuthUrl(NaverVO vo) {
		REDIRECT_URL = vo.getCallback_url() + "/login_naver";
		String result = NAVER_AUTH_URL + "?state=success&response_type=code&auth_type=reauthenticate&client_id="
				+ vo.getClient_id() + "&redirect_uri=" + REDIRECT_URL;

		return "redirect:" + result;
	}

	@RequestMapping(value = "/login_naver")
	public String oauthKakao(NaverVO vo, Model model, HttpSession session, MemberVO member) throws Exception {
		String asToken = getToken(vo);
		vo.setAccess_token(asToken);
		HashMap<String, Object> userInfo = getProfile(vo);

		String id = (String) userInfo.get("id");
		String email = (String) userInfo.get("email");
		// 핸드폰번호 하이픈 제거
		String phone = userInfo.get("mobile").toString().replaceAll(Pattern.quote("-"), "");

		System.out.println("test" + phone);

//		String nickname = (String) userInfo.get("nickname");
//
		member.setMb_id(id);
		member.setMb_email(email);
		member.setMb_phone(phone);

		model.addAttribute("naverInfo", userInfo);
		session.setAttribute("mb_Id", userInfo);

		if (member.getMb_id() != null) {
			memberService.insertMember(member);
		} else {
			System.out.println("테스트");
			return "redirect:index.jsp";
		}

		return "redirect:index.jsp";
	}

	// 접근토근 요청/응답정보
	public String getToken(NaverVO vo) throws Exception {
		System.out.println(vo.toString());
		String apiUrl = NAVER_TOKEN_URL;

		HttpClient client = HttpClientBuilder.create().build();

		HttpPost post = new HttpPost(NAVER_TOKEN_URL);
		Map<String, String> m = new HashMap<>();
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getClient_id()); // 애플리케이션 클라이언트 아이디값";
		m.put("client_secret", vo.getClient_secret());// 애플리케이션 클라이언트 시크릿값";
		m.put("redirect_uri", URLEncoder.encode(vo.getCallback_url(), "UTF-8"));
		m.put("code", vo.getCode());
		m.put("state", vo.getState());

		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
//				System.out.println("body333: "+body);
			JsonNode rootNode = mapper.readTree(body);
			tokenChk = rootNode.get("access_token").asText();

		} catch (Exception e) {
			e.printStackTrace();
		}

		REDIRECT_URL = "http://newjeonsis.ml";
		return tokenChk;

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

	// 네이버 프로필 정보 가져오기
	public HashMap<String, Object> getProfile(NaverVO vo) throws Exception {
		System.out.println("vo: " + vo);
		String header = "Bearer " + vo.getAccess_token(); // Bearer 다음에 공백 추가

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(NAVER_PROFIL_URL);
		HashMap<String, Object> map = null;
		get.setHeader("Authorization", header);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());

			System.out.println("body999: " + body);
			JsonNode rootNode = mapper.readTree(body);
			JsonNode response = rootNode.get("response");

			if (!rootNode.asText().equals("null")) {
				map = new HashMap<>();
				// 이곳에서 데이터베이스 연동로직 처리할 것
				System.out.println("id: " + response.get("id").asText());
//				System.out.println("age: " + response.get("age").asText());
//				System.out.println("gender: " + response.get("gender").asText());
				System.out.println("email: " + response.get("email").asText());
				System.out.println("mobile: " + response.get("mobile").asText());
//				System.out.println("nickname: " + response.get("nickname").asText());

				map.put("msg", "ok");
				map.put("id", response.get("id").asText());
//				map.put("age", response.get("age").asText());
//				map.put("gender", response.get("gender").asText());
				map.put("email", response.get("email").asText());
				map.put("mobile", response.get("mobile").asText());
//				map.put("nickname", response.get("nickname").asText());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;

	}

//	@RequestMapping(value = { "/login/naver" })
//	public String home() {
//		System.out.println("컨트롤러");
//		return "views/login_naver";
//	}
}
