package com.ticket.biz.board;

import java.util.List;

import com.ticket.biz.board.BoardVO;

public interface BoardService {

	//CRUD 기능 구현 
	
	// 글 등록
	void insertBoard(BoardVO vo);
	// 글 삭제 
	void deleteBoard(BoardVO vo);
	// 글 수정 
	void updateBoard(BoardVO vo);
	// 상세보기
	BoardVO getBoard(BoardVO vo);
	
	List<BoardVO> getBoardList(BoardVO vo); 
	
	int totalBoardListCnt(BoardVO vo);

}
