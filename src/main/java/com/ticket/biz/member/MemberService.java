package com.ticket.biz.member;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface MemberService {
	/*회원가입*/
	void insertMember(MemberVO vo);
	
	/*회원수정*/
	void updateMember(MemberVO vo);

	/*회원탈퇴*/
	int deleteMember(MemberVO vo);
<<<<<<< HEAD
	
	/*로그인*/
	public MemberVO loginCheck(MemberVO vo);
	
	/*로그아웃*/
=======

	public MemberVO loginCheck(MemberVO vo);

>>>>>>> fa71b96e42f31a3ebf4ea989a94b174706ff32ed
	public void logout(HttpSession session);

	// 회원목록 조회
	List<MemberVO> getMemberList(MemberVO vo);
<<<<<<< HEAD
	
	// 회원목록 페이징
	int totalMemberListCnt(MemberVO vo);
	
=======

	int totalMemberListCnt(MemberVO vo);


>>>>>>> fa71b96e42f31a3ebf4ea989a94b174706ff32ed
	/*회원 마이페이지*/
	   MemberVO getMember(MemberVO vo);
}
