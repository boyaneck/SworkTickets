package com.ticket.biz.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능

	// 댓글 등록
	public void insertReview(ReviewVO vo) {
		mybatis.insert("ReviewDAO.insertReview", vo);
	}

	// 댓글 삭제
	public void deleteReview(ReviewVO vo) {
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}

	 //댓글 수정
		public void updateReview(ReviewVO vo) {
			mybatis.update("ReviewDAO.updateReview",vo);
		}



	// 댓글 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {

		return mybatis.selectList("ReviewDAO.getReviewList",vo);

	}

	// 전체댓글 목록 갯수
	public int getTotal(ReviewVO vo) {
		return mybatis.selectOne("ReviewDAO.totalReviewListCnt", vo);

	}

}
