package com.ticket.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;
import com.ticket.biz.pwtest.PwCheck;

@Controller
@SessionAttributes("login")
public class LoginController {
	@Autowired
	private PwCheck pwCheck;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, HttpServletResponse response) {
		String password = vo.getMb_pw();

		if (vo.getMb_id() == null || vo.getMb_id().equals("")) {
//			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디와 비밀번호를 입력해주세요');");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (memberService.getMember(vo) != null) {
			boolean login = pwCheck.isMatch(vo.getMb_pw(), memberService.getMember(vo).getMb_pw());
//			if((login == true)&&memberService.getMember(vo).getMb_id().equals("admin")) {
//				session.setAttribute("mb_Id", memberService.getMember(vo).getMb_id());
//			
//				return "admin/admin_index";
//				
//			}
//			else
				if (login == true) {
				session.setAttribute("mb_Id", memberService.getMember(vo).getMb_id());
			
				return "redirect:index.jsp";
				
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter script;
				try {
					script = response.getWriter();
					script.println("<script>");
					script.println("alert('비밀번호가 다르거나 비밀번호를 입력해주세요');");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
					script.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.');");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:login.jsp";
	}

	@RequestMapping(value = "/logoutGO")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.jsp";
	}

}
