package com.ticket.biz.member.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.member.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원 수정 비밀번호 확인
	public int pwChk(Map<String, Object> param) {
		return mybatis.selectOne("MemberDAO.pwChk", param);
	}

	// 아이디 중복체크
	public int idChk(Map<String, Object> param) {

		return mybatis.selectOne("MemberDAO.idChk", param);
	}

	/* 회원가입 */
	public void insertMember(MemberVO vo) {
//		System.out.println(vo);
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	/* 회원탈퇴 */
	public int deleteMember(MemberVO vo) {
		return mybatis.delete("MemberDAO.deleteMember", vo);
	}

	/* 회원조회 */
	public MemberVO getMember(MemberVO vo) {
//		System.out.println("mybatis getMember() 기능");
		return mybatis.selectOne("MemberDAO.getMember", vo);
	}

	/* 회원수정 */
	public void updateMember(MemberVO vo) {
		System.out.println("mybatis회원정보수정 기능");
		mybatis.update("MemberDAO.updateMember", vo);
		System.out.println("회원수정" + vo);
	}

	public MemberVO loginCheck(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.login", vo);
	}

	// 회원목록 조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		return mybatis.selectList("MemberDAO.getMemberList", vo);
	}

	// 전체 회원목록 개수
	public int totalMemberListCnt(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.totalMemberListCnt", vo);
	}

	// 아이디, 비번찾기
	public MemberVO find(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.find", vo);
	}

	// 비번 변경
	public int change(MemberVO vo) {
		return mybatis.update("MemberDAO.change", vo);
	}

}
