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

		// CRUD 기능

		// 글 등록
		public void insertBoard(BoardVO vo) {
			mybatis.insert("BoardDAO.insertBoard", vo);
		}

		// 글 삭제
		public void deleteBoard(BoardVO vo) {
			mybatis.delete("BoardDAO.deleteBoard", vo);
		}

		// 글 수정
		public void updateBoard(BoardVO vo) {
			mybatis.update("BoardDAO.updateBoard", vo);
		}

		// 글 상세보기
		public BoardVO getBoard(BoardVO vo) {
			return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
		}

		// 글 목록 조회
		public List<BoardVO> getBoardList(BoardVO vo) {
			return mybatis.selectList("BoardDAO.getBoardList", vo);
		}

		// 전체글 목록 갯수
		public int totalBoardListCnt(BoardVO vo) {
			return mybatis.selectOne("BoardDAO.totalBoardListCnt", vo);

		}
	}


