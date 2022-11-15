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
		System.out.println("Faq insert 기능 처리 전");
		System.out.println("faq_title"+ vo.getFaq_title());
		mybatis.insert("FaqDAO.insertFaq",vo);
		System.out.println("Faq insert 기능 수행함");
	}
	// 글 삭제
	public void deleteFaq(FaqVO vo) {
		System.out.println("delete faq 기능 처리 전");
		mybatis.delete("FaqDAO.deleteFaq", vo);
		System.out.println("delete faq 기능 수행함");
	}

	// 글 수정
	public void updateFaq(FaqVO vo) {
		System.out.println("update faq 기능 처리 전");
		mybatis.update("FaqDAO.updateFaq",vo);
		System.out.println("update faq 기능 수행함");
	}

	//글 상세보기
	public FaqVO getFaq(FaqVO vo) {
		System.out.println("GetFaq 기능 처리 전");
	 return (FaqVO)mybatis.selectOne("FaqDAO.getFaq", vo);
	}
	
	//관리자 글 상세보기
		public FaqVO adminFaq(FaqVO vo) {
			System.out.println("adminFaq 기능 처리 전");
		 return (FaqVO)mybatis.selectOne("FaqDAO.adminFaq", vo);
		}

	//글 목록 조회
	public List<FaqVO> getFaqList(FaqVO vo){
		System.out.println("getFaqList 기능 처리 전 ");

		return mybatis.selectList("FaqDAO.getFaqList", vo);

		}

	//전체글 목록 갯수
		 public int totalFaqListCnt(FaqVO vo) {
			 System.out.println("===> mybatis로 getFaqListCnt() 기능 처리");
			 return mybatis.selectOne("FaqDAO.totalFaqListCnt",vo);

		 }
		public List<FaqVO> adminFaqList(FaqVO vo) {
			System.out.println("adminFaqList 기능 처리 전 ");

			return mybatis.selectList("FaqDAO.adminFaqList", vo);
		}
		public int totaladminFaqListCnt(FaqVO vo) {
			System.out.println("===> mybatis로 getFaqListCnt() 기능 처리");
			 return mybatis.selectOne("FaqDAO.totaladminFaqListCnt",vo);
		}
}
