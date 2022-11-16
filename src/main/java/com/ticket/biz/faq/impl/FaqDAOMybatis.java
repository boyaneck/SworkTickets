package com.ticket.biz.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.faq.FaqVO;



@Repository
public class FaqDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

     //CRUD 기능

	//글 등록
	public void insertFaq(FaqVO vo) {
		mybatis.insert("FaqDAO.insertFaq",vo);
	}
	// 글 삭제
	public void deleteFaq(FaqVO vo) {
		mybatis.delete("FaqDAO.deleteFaq", vo);
	}

	// 글 수정
	public void updateFaq(FaqVO vo) {
		mybatis.update("FaqDAO.updateFaq",vo);
	}

	//글 상세보기
	public FaqVO getFaq(FaqVO vo) {
	 return (FaqVO)mybatis.selectOne("FaqDAO.getFaq", vo);
	}
	
	//관리자 글 상세보기
		public FaqVO adminFaq(FaqVO vo) {
		 return (FaqVO)mybatis.selectOne("FaqDAO.adminFaq", vo);
		}

	//글 목록 조회
	public List<FaqVO> getFaqList(FaqVO vo){

		return mybatis.selectList("FaqDAO.getFaqList", vo);

		}

	//전체글 목록 갯수
		 public int totalFaqListCnt(FaqVO vo) {
			 return mybatis.selectOne("FaqDAO.totalFaqListCnt",vo);

		 }
		public List<FaqVO> adminFaqList(FaqVO vo) {

			return mybatis.selectList("FaqDAO.adminFaqList", vo);
		}
		public int totaladminFaqListCnt(FaqVO vo) {
			 return mybatis.selectOne("FaqDAO.totaladminFaqListCnt",vo);
		}
}
