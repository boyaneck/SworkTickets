package com.ticket.biz.board.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.board.BoardService;
import com.ticket.biz.board.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAOMybatis boardDAO;

	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("insertBoard ServiceImpl 에서 탐");
		boardDAO.insertBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		System.out.println("deleteBoard 서비스 수행");
		boardDAO.deleteBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
		System.out.println("updateBoard service 에서 실행");
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public int totalBoardListCnt(BoardVO vo) {
		return boardDAO.totalBoardListCnt(vo);
	}


}
