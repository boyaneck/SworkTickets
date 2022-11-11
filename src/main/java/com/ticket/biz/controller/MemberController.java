package com.ticket.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;
import com.ticket.biz.pwtest.PwCheck;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(@RequestParam Map<String, Object> param) {
//        int result = memberService.idChk(param);
		return memberService.idChk(param);

	}
	// 회원 수정 비밀번호 확인
//	@ResponseBody
//	@RequestMapping(value = "/pwChk", method = RequestMethod.POST)
//	public int pwChk(@RequestParam Map<String, Object> param) {
//		return memberService.pwChk(param);
//	}

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

	// 회원수정 접근 비밀번호
	@RequestMapping(value = "/mypageView")
	public String mypageConfirm() throws IOException {

//			if (vo.getMb_id() == null || vo.getMb_id().equals("")) {
//				throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
//			}
		return "member/mypageConfirm";
	}

//			System.out.println(session.getAttribute("mb_Id"));
//			System.out.println(vo.getMb_pw());
//			System.out.println("aaaa");

	// 회원마이페이지
	@RequestMapping(value = "/mypage", method= RequestMethod.POST)
	public String getMyPage(MemberVO vo, Model model, HttpSession session, HttpServletResponse response) {
//		System.out.println("회원정보가져오기");
		model.addAttribute("member", memberService.getMember(vo));
//		System.out.println(memberService.getMember(vo));
		if (memberService.getMember(vo) != null) {
			if (session.getAttribute("mb_Id").equals("admin")) {
				System.out.println("어드민");
				return "member/mypage";
			} else {
//				System.out.println("엘즈문");
				boolean login = pwCheck.isMatch(vo.getMb_pw(), memberService.getMember(vo).getMb_pw());
				if (login == true) {
					System.out.println("마이페이지접근");
					session.setAttribute("mb_Id", memberService.getMember(vo).getMb_id());
					return "member/mypage";
				} else {
					response.setCharacterEncoding("utf-8");
					response.setContentType("text/html; charset=utf-8");
					PrintWriter script;
					try {
						script = response.getWriter();
						script.println("<script>");
						script.println("alert('비밀번호를 올바르게 입력해주세요');");
						script.println("location.href = 'mypageView'");
						script.println("</script>");
						script.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}

		return "member/mypage";

	}

	// 회원 수정
	@RequestMapping("/updateMember")
	public String updateMember(@ModelAttribute("member") MemberVO vo, HttpSession session) {
		if (vo.getMb_id().equals(session.getAttribute("mb_Id").toString())
				|| session.getAttribute("mb_Id").equals("admin")) {
			System.out.println("입력받은거: "+vo.getMb_pw());
			System.out.println("DB값: "+memberService.getMember(vo).getMb_pw());
//			boolean login = pwCheck.isMatch(vo.getMb_pw(), memberService.getMember(vo).getMb_pw());
//			System.out.println("로그인"+login);
			System.out.println("Match: "+pwCheck.isMatch(vo.getMb_pw(), memberService.getMember(vo).getMb_pw()));
			System.out.println("Match222: "+vo.getMb_pw().equals(memberService.getMember(vo).getMb_pw()));
			
			if(vo.getMb_pw().equals(memberService.getMember(vo).getMb_pw())) {
				memberService.updateMember(vo);
				return "member/mypage";
			}else {
				String password = pwCheck.encrypt(vo.getMb_pw());
				vo.setMb_pw(password);
				memberService.updateMember(vo);
				return "member/mypage";
			}
//			if (vo.getMb_pw().equals((memberService.getMember(vo).getMb_pw()))) {
//				System.out.println("이프문");
//				return "member/mypage";
//			} else {
//				System.out.println("엘즈문");
//				String password = pwCheck.encrypt(vo.getMb_pw());
//				vo.setMb_pw(password);
//				memberService.updateMember(vo);
//				return "member/mypage";
//			}
		} else {
			return "redirect:member/mypage?error=1";
		}
			
		

	}

//	// 멤버등록
//	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
//	public String insertMember(MemberVO vo) throws IllegalStateException {
////		System.out.println("11111111111111111111"+ session.getAttribute("kakaoLogin"));
//		System.out.println("2222222222222"+vo.getMb_id());
//		return "redirect:index.jsp";
//	}
	// 창일 추가
	@Autowired
	private PwCheck pwCheck;

	// ---
	// 멤버등록
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO vo) throws IllegalStateException {
		String password = vo.getMb_pw();
		// 창일 추가
		vo.setMb_pw(pwCheck.encrypt(password));
		// ---
		memberService.insertMember(vo);
		return "redirect:index.jsp";
	}

//	/* 이용약관 */
//	@RequestMapping("/registerTerm")
//	public ModelAndView registerTerm(@RequestParam(value = "agree1", defaultValue = "false") Boolean agree1,
//			@RequestParam(value = "agree2", defaultValue = "false") Boolean agree2, MemberVO vo) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		if (agree1 == true && agree2 == true) {
//			mv.setViewName("views/insertMember");
//			return mv;
//		} else {
//			mv.setViewName("views/step1");
//			return mv;
//		}
//
//	}
	
	   /* 이용약관 */
	   @RequestMapping("/registerTerm")
	   public ModelAndView registerTerm(@RequestParam(value = "agree", defaultValue = "false") Boolean agree,
	         MemberVO vo) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      if (agree == true) {
	         mv.setViewName("views/insertMember");
	         return mv;
	      } else {
	         mv.setViewName("views/step1");
	         return mv;
	      }

	   }

	// 이용약관 뷰

	@RequestMapping(value = "/step1")
	public String register_term() {
		return "views/step1";
	}

	// 회원탈퇴
	/* @ResponseBody */
	@RequestMapping(value = "/deleteMember")
	public String deleteMember(MemberVO vo, HttpSession session) {
		
		int result = memberService.deleteMember(vo);
		if(session.getAttribute("mb_Id").equals("admin")) {
			return "redirect:/getMemberList";
		}else {
			session.invalidate();
			return "redirect:login.jsp";
		}
	}

	// 관리자 회원조회
	@RequestMapping("/getMemberList")
	public String getMemberListPost(MemberVO vo, String nowPageBtn, Model model) {
		System.out.println("회원목록 검색 처리");
		
		memberService.deleteMember2();
		
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

	// 아이디찾기폼
	@RequestMapping("/findIdform")
	public String find(MemberVO vo, Model model) {
//		System.out.println("아이디찾기" + vo);
		vo = memberService.find(vo);
//		System.out.println("찾은결과: " + vo);
		if (vo != null) {
			model.addAttribute("mb_Id", vo.getMb_id());
			return "views/findId";
		} else {
			return "views/findId";
		}
	}

	// 비밀번호찾기폼
	@RequestMapping("/findPwform")
	public String findPw(MemberVO vo, Model model) {
		vo = memberService.find(vo);
		System.out.println("찾은결과: " + vo);
		if (vo != null) {
			model.addAttribute("mb_Id", vo.getMb_id());
			return "views/findPw";
		} else {
			return "views/findPw";
		}
	}

//	// 비밀번호 변경하기
//	@RequestMapping("/change")
//	public String change(MemberVO vo, Model model) {
//		System.out.println("비밀번호변경" + vo);
//		int a = memberService.change(vo);
//		System.out.println("변경여부:" + a);
//		return "redirect:login.jsp";
//	}
	// 비밀번호 변경하기
	@RequestMapping("/change")
	public String change(MemberVO vo, Model model) {
		System.out.println("비밀번호변경" + vo);
		// 창일 추가
		String password = pwCheck.encrypt(vo.getMb_pw());
		vo.setMb_pw(password);
		// ---
		int a = memberService.change(vo);
		System.out.println("변경여부:" + a);
		return "redirect:login.jsp";
	}
	
	//관리자페이지로 이동
	@RequestMapping(value = "/admin")
	public String adminView() {
		return "admin/adminIndex";
	}
	
	
	//관리자회원등록 페이지로 이동
	@RequestMapping(value = "/admin/member")
	public String admin_memberView() {
		return "admin/adminMember";
	}
	@RequestMapping(value = "/admin/insertMember", method = RequestMethod.POST)
	public String admin_insertMember(MemberVO vo) throws IllegalStateException {
		String password = vo.getMb_pw();
		// 창일 추가
		vo.setMb_pw(pwCheck.encrypt(password));
		// ---
		memberService.insertMember(vo);
		return "redirect:/getMemberList";
	}
}
