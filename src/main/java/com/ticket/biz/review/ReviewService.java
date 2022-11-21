package com.ticket.biz.review;

import java.util.List;

public interface ReviewService {
	void insertReview(ReviewVO vo); //댓글 등록
	
	List<ReviewVO> getReviewList(ReviewVO vo); //목록 요청
	
	int getTotal(ReviewVO vo); //댓글 개수
	
	void deleteReview(ReviewVO vo);   // 댓글 삭제 
	
	void updateReview(ReviewVO vo);
	
	
	List<ReviewVO> myRecord(String review_writer);

//	List<ReviewVO> getReviewList(String review_wrtier);
	

	
//	List<ReviewVO> getReviewList(String review_wrtier); //어드민용 회원 댓글 불러오긔
}
