package com.ticket.biz.one;

import java.util.List;

public interface OneService {

	//CRUD 기능 구현

	// 글 등록
	void insertOne(OneVO vo);
	// 글 삭제
	void deleteOne(OneVO vo);
	// 글 수정
	void updateOne(OneVO vo);
	// 상세보기
	OneVO getOne(OneVO vo);

	List<OneVO> getOneList(OneVO vo);

	int totalOneListCnt(OneVO vo);

}
