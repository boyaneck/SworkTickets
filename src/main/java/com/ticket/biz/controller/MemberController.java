package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.Map;

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
	@RequestMapping(value = "/mypage")
	public String getMyPage(MemberVO vo, Model model, HttpSession session) {

		System.out.println("회원정보가져오기");


		model.addAttribute("member", memberService.getMember(vo));

//	      System.out.println("1111111"+memberService.getMember(vo));
		return "member/mypage";
	}

	// 회원 수정
	@RequestMapping("/updateMember")
	public String updateMember(@ModelAttribute("member") MemberVO vo, HttpSession session) {
		if (vo.getMb_id().equals(session.getAttribute("mb_Id").toString())
				|| session.getAttribute("mb_Id").equals("admin")) {
			String password = pwCheck.encrypt(vo.getMb_pw());
			vo.setMb_pw(password);
			memberService.updateMember(vo);
			return "member/mypage";
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

	/* 이용약관 */
	@RequestMapping("/registerTerm")
	public ModelAndView registerTerm(@RequestParam(value = "agree1", defaultValue = "false") Boolean agree1,
			@RequestParam(value = "agree2", defaultValue = "false") Boolean agree2, MemberVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (agree1 == true && agree2 == true) {
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
		session.invalidate();
		int result = memberService.deleteMember(vo);
		System.out.println(result);
		return "redirect:login.jsp";
	}

	// 관리자 회원조회
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

	// 아이디찾기폼
	@RequestMapping("/findIdform")
	public String find(MemberVO vo, Model model) {
		System.out.println("아이디찾기" + vo);
		vo = memberService.find(vo);
		System.out.println("찾은결과: " + vo);
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
}
