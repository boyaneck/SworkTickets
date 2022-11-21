package com.ticket.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemberService {
	
	
	   // 회원 수정 비밀번호 확인
	   int pwChk(Map<String, Object> param);
	   //아이디 중복체크
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

	// 탈퇴회원 완전 삭제
	void deleteMember2();
	
	// 회원목록 조회
	List<MemberVO> getMemberList(MemberVO vo);

	// 회원목록 페이징
	int totalMemberListCnt(MemberVO vo);

	/*회원 마이페이지*/
	MemberVO getMember(MemberVO vo);

	// 아이디  찾기
	List<MemberVO> find(MemberVO vo);

	//비번 찾기
	MemberVO findpw(MemberVO vo);
	
	// 비번 변경
	int change(MemberVO vo);


}
