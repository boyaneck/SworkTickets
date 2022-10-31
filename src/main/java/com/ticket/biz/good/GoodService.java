package com.ticket.biz.good;

import java.util.List;

public interface GoodService {
	//CRUD 기능의 메소드 구현
		//좋아요등록
		void insertGood(GoodVO vo);

		//좋아요취소
		void updateGood(GoodVO vo);

		//좋아요순 조회
		List<GoodVO> getGoodList(GoodVO vo);

		//해당 전시 좋아요갯수
		int GoodCnt (GoodVO vo);
		
		//좋아요 체크
		GoodVO getGoodChk(GoodVO vo);
		
		boolean getGoodYN(GoodVO vo);
}
