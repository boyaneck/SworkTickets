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
//	public void insertFaq(FaqVO vo) {
//		System.out.println("Board insert 기능 처리 전");
//		mybatis.insert("FaqDAO.insertBoard",vo);
//		System.out.println("Board insert 기능 수행함");
//	}
//	// 글 삭제
//	public void deleteFaq(FaqVO vo) {
//		System.out.println("board delete 기능 처리 전");
//		mybatis.delete("FaqDAO.deleteBoard", vo);
//		System.out.println("Board delete 기능 수행함");
//	}
//	
//	// 글 수정
//	public void updateFaq(FaqVO vo) {
//		System.out.println("update board 기능 처리 전");
//		mybatis.update("FaqDAO.updateBoard",vo);
//		System.out.println("update board 기능 수행함");
//	}
//	
//	//글 상세보기
//	public FaqVO getFaq(FaqVO vo) {
//		System.out.println("Getboard 기능 처리 전");
//	 return (FaqVO)mybatis.selectOne("FaqDAO.getBoard", vo);
//	}
	
	//글 목록 조회
	public List<FaqVO> getFaqList(FaqVO vo){
		System.out.println("getBoardList 기능 처리 전 ");
	
			
		return mybatis.selectList("FaqDAO.getFaqList", vo);
		
	
			
		
		}
		
	
	//전체글 목록 갯수
		 public int totalFaqListCnt(FaqVO vo) {
			 System.out.println("===> mybatis로 getBoardListCnt() 기능 처리");
			 return mybatis.selectOne("FaqDAO.totalFaqListCnt",vo);
			 
		 }
}
