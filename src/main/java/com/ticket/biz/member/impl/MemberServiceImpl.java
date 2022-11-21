package com.ticket.biz.member.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.member.MemberService;
import com.ticket.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	//패스워드찾기
    @Override
    public int pwChk(Map<String, Object> param) {
        return memberDAO.pwChk(param);
    }
    
	   //아이디 중복체크
    @Override
    public int idChk(Map<String, Object> param) {
        return memberDAO.idChk(param);
    }
    
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return memberDAO.loginCheck(vo);
	}

	@Override
	public void logout(HttpSession session) {

	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}


	@Override
	public int totalMemberListCnt(MemberVO vo) {
		return memberDAO.totalMemberListCnt(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		return memberDAO.deleteMember(vo);
	}

	@Override
	public void deleteMember2() {
		memberDAO.deleteMember2();
	}
	   @Override
	   public MemberVO getMember(MemberVO vo) {
	      return memberDAO.getMember(vo);
	   }

	   // 회원목록
	   @Override
	   public List<MemberVO> getMemberList(MemberVO vo) {
		   return memberDAO.getMemberList(vo);
	   }
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	public List<MemberVO> find(MemberVO vo) {
		return memberDAO.find(vo);
	}
	@Override
	public MemberVO findpw(MemberVO vo) {
		return memberDAO.findpw(vo);
	}
	@Override
	public int change(MemberVO vo) {
		return memberDAO.change(vo);
	}

}
