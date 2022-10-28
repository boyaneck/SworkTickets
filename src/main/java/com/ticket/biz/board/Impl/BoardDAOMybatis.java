package com.ticket.biz.board.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.board.BoardVO;

@Repository
public class BoardDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
     //CRUD 기능
	
	//글 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("Board insert 기능 처리 전");
		mybatis.insert("BoardDAO.insertBoard",vo);
		System.out.println("Board insert 기능 수행함");
	}
	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("board delete 기능 처리 전");
		mybatis.delete("BoardDAO.deleteBoard", vo);
		System.out.println("Board delete 기능 수행함");
	}
	
	// 글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("update board 기능 처리 전");
		mybatis.update("BoardDAO.updateBoard",vo);
		System.out.println("Board update 기능 수행함");
	}
	
	//글 상세보기
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("Getboard 기능 처리 전");
	 return (BoardVO)mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	//글 목록 조회
	public List<BoardVO> getBoardList(BoardVO vo){
		System.out.println("getBoardList 기능 처리 전 ");
	
			
		return mybatis.selectList("BoardDAO.getBoardList", vo);
		
	
			
		
		}
		
	
	//전체글 목록 갯수
		 public int totalBoardListCnt(BoardVO vo) {
			 System.out.println("===> mybatis로 getBoardListCnt() 기능 처리");
			 return mybatis.selectOne("BoardDAO.totalBoardListCnt",vo);
			 
		 }
}
