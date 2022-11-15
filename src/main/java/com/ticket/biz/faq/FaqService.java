package com.ticket.biz.faq;

import java.util.List;

public interface FaqService {

	//CRUD 기능 구현

	// 글 등록
	void insertFaq(FaqVO vo);
	// 글 삭제
	void deleteFaq(FaqVO vo);
	// 글 수정
	void updateFaq(FaqVO vo);
	// 상세보기
	FaqVO getFaq(FaqVO vo);
	// 관리자 상세보기
	FaqVO adminFaq(FaqVO vo);
	
	List<FaqVO> getFaqList(FaqVO vo);
	
	List<FaqVO> adminFaqList(FaqVO vo);

	int totalFaqListCnt(FaqVO vo);

}
