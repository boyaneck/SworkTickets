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
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	/* 회원탈퇴 */
	public int deleteMember(MemberVO vo) {
		return mybatis.delete("MemberDAO.deleteMember", vo);
	}

	/* 회원조회 */
	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getMember", vo);
	}

	/* 회원수정 */
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}

	public MemberVO loginCheck(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.login", vo);
	}

	// 탈퇴회원 완전삭제
	public void deleteMember2() {
		mybatis.delete("MemberDAO.deleteMember2");
	}
	
	// 회원목록 조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		return mybatis.selectList("MemberDAO.getMemberList", vo);
	}

	// 전체 회원목록 개수
	public int totalMemberListCnt(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.totalMemberListCnt", vo);
	}

	// 아이디찾기
	public List<MemberVO> find(MemberVO vo) {
		return mybatis.selectList("MemberDAO.find", vo);
	}
	// 비번찾기
	public MemberVO findpw(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findpw", vo);
	}

	// 비번 변경
	public int change(MemberVO vo) {
		return mybatis.update("MemberDAO.change", vo);
	}

}
