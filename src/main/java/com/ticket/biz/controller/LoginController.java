package com.ticket.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;

@Controller
@SessionAttributes("login")
public class LoginController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		System.out.println("로그인 인증 처리...");
		if (vo.getMb_id() == null || vo.getMb_id().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}

		if (memberService.loginCheck(vo) != null) {
			session.setAttribute("mb_Id", memberService.loginCheck(vo).getMb_id());
//			session.setAttribute("userName", memberService.loginCheck(vo).getMb_name());
			System.out.println("아이디: " + memberService.loginCheck(vo).getMb_id());
			return "redirect:index.jsp";
		} else {
			return "login.jsp?error=1";
		}
	}

	
	  @RequestMapping("/logoutGo") 
	  public String logout(HttpSession session) {
	  session.invalidate(); 
	  return "redirect:login.jsp"; }

}
