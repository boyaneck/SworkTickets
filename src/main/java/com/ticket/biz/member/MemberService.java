package com.ticket.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemberService {
	
	
	int idChk(Map<String, Object> param);
	/*회원가입*/
	void insertMember(MemberVO vo);

	/*회원수정*/
	void updateMember(MemberVO vo);

	/*회원탈퇴*/
	int deleteMember(MemberVO vo);

	/*로그인*/
	public MemberVO loginCheck(MemberVO vo);

	/*로그아웃*/
	public void logout(HttpSession session);

	// 회원목록 조회
	List<MemberVO> getMemberList(MemberVO vo);

	// 회원목록 페이징
	int totalMemberListCnt(MemberVO vo);

	/*회원 마이페이지*/
	MemberVO getMember(MemberVO vo);

	// 아이디, 비번 찾기
	MemberVO find(MemberVO vo);

	// 비번 변경
	int change(MemberVO vo);


}
