package com.ticket.biz.good;

import java.util.List;

import com.ticket.biz.exhibition.ExhibitionVO;

public interface GoodService {
	//CRUD 기능의 메소드 구현
		//좋아요등록
		public int insertGood(GoodVO vo);
		
		//좋아요삭제
		public int deleteGood(GoodVO vo);
		
		//좋아요순 조회
		public List<GoodVO> getGoodList();

		public int getMyGoodListCnt(GoodVO vo);

		public List<ExhibitionVO> getMyGoodList(GoodVO vo);

				//좋아요 체크
				GoodVO getGoodChk(GoodVO vo);
				
				//좋아요 체크
				boolean getGoodYN(GoodVO vo);
}
	

