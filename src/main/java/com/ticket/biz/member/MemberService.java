package com.ticket.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemberService {
	/*회원가입*/
	void insertMember(MemberVO vo);
	/*회원수정*/
	void updateMember(MemberVO vo);

	/*회원탈퇴*/
	int deleteMember(MemberVO vo);
	
	public MemberVO loginCheck(MemberVO vo);
	
	public void logout(HttpSession session);

	// 회원목록 조회
	List<MemberVO> getMemberList(MemberVO vo);

	int totalMemberListCnt(MemberVO vo);
	
	
	/*회원 마이페이지*/
	   MemberVO getMember(MemberVO vo);
}
