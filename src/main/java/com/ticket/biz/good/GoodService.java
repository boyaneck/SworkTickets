package com.ticket.biz.good;

import java.util.List;

import com.ticket.biz.exhibition.ExhibitionVO;

public interface GoodService {
	//CRUD 기능의 메소드 구현
		//좋아요등록
		void insertGood(GoodVO vo);

		//좋아요삭제
		void deleteGood(GoodVO vo);

		//좋아요순 조회
		List<GoodVO> getGoodList();

		//좋아요 체크
		GoodVO getGoodChk(GoodVO vo);

		//좋아요 체크
		boolean getGoodYN(GoodVO vo);

		List<ExhibitionVO> getMyGoodList(GoodVO vo);

		int getMyGoodListCnt(GoodVO vo);
}
