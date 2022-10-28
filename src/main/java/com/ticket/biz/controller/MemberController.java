package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("아이디", "MB_ID");
		conditionMap.put("이름", "MB_NAME");
		conditionMap.put("전화번호", "MB_PHONE");
		conditionMap.put("이메일", "MB_EMAIL");
		return conditionMap;
	}
	
	   // 회원 마이페이지
	   @RequestMapping(value="/mypage")
	   public String getMyPage(MemberVO vo, Model model) {
	      System.out.println("회원정보가져오기");
	      model.addAttribute("member", memberService.getMember(vo));
//	      System.out.println("1111111"+memberService.getMember(vo));
	      return "member/mypage";
	   }

	//멤버등록
	@RequestMapping(value="/insertMember", method=RequestMethod.POST)
	public String insertMember(MemberVO vo) throws IllegalStateException {
		memberService.insertMember(vo);
		return "redirect:index.jsp";
	}
	
	// 회원탈퇴
	/* @ResponseBody */
		@RequestMapping(value="/deleteMember")
		public String deleteMember(MemberVO vo, HttpSession session) {
			session.invalidate();
		int result = memberService.deleteMember(vo);
		System.out.println(result);
		return "redirect:login.jsp";
		}

	//관리자 회원조회
	@RequestMapping("/getMemberList")
	public String getMemberListPost(MemberVO vo, String nowPageBtn, Model model) {
		System.out.println("회원목록 검색 처리");

		// 총 목록 수
		int totalPageCnt = memberService.totalMemberListCnt(vo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "admin/getMemberList";
	}


	@Autowired
	MailSender sender;
	@Autowired
	HttpSession session;

	// 인증번호 이메일 전송 Ajax
	@ResponseBody
	@RequestMapping(value = "/email_Send", method = RequestMethod.POST)
	public String mail_Send(@RequestParam String email) {
		System.out.println("email_Send이동");
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);

		// 보낼 인증번호 난수 생성 로직
		for (int i = 0; i < 3; i++) {
			// A~Z(대문자)까지 랜덤 알파벳 생성
			int index = random.nextInt(25) + 65;
			key += (char) index;
			// 랜덤 정수를 생성
			int numIndex = random.nextInt(10);
			key += numIndex;
		}
		// 이메일의 제목이 되는 부분
		message.setSubject("인증번호 입력을 위한 메일 전송");
		// 이메일의 내용이 되는 부분
		message.setText("인증 번호 : " + key);
		// 이메일의 보내는 사람이 되는 부분(반드시 smtp설정한 이메일주소 입력, 다를 경우 인증 안됨) 예시: admin@gmail.com 등..
		message.setFrom("hm_tickets@naver.com");
		System.out.println("인증번호 값: " + key);

		sender.send(message);
		session.setAttribute("emailKey", key);
		return "ok";
	}

	// 이메일 인증번호 체크 Ajax
	@ResponseBody
	@RequestMapping(value = "/email_Check", method = RequestMethod.POST)
	public boolean mail_Check(String emailCheck) {
		boolean result = false;
		String emailKey = (String) session.getAttribute("emailKey");

		System.out.println("보낸 인증번호 값 : " + emailKey + ", 사용자가 입력한 값 : " + emailCheck);
		if (emailCheck.equals(emailKey)) {

			result = true;
		}
		session.removeAttribute("emailKey");
		return result;
	}

}
