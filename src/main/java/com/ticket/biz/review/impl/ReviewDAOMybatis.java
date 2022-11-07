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
		System.out.println("Review insert 기능 처리 전 dao에서 ");
		System.out.println("review mybatis to String" + vo.toString());
		mybatis.insert("ReviewDAO.insertReview", vo);
		System.out.println("Review insert 기능 수행함");
	}

	// 댓글 삭제
	public void deleteReview(ReviewVO vo) {
		System.out.println("review delete 기능 처리 전");
		mybatis.delete("ReviewDAO.deleteReview", vo);
		System.out.println("review delete 기능 수행함");
	}

	 //댓글 수정
		public void updateReview(ReviewVO vo) {
			System.out.println("update Review  Mybatis에서 기능 처리 전!!!!!!");
			mybatis.update("ReviewDAO.updateReview",vo);
			System.out.println("update review 기능 mybatis에서  수행함");
		}



	// 댓글 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("getReviewList Mybatis 기능 처리 전 ");

		return mybatis.selectList("ReviewDAO.getReviewList",vo);

	}

	// 전체댓글 목록 갯수
	public int getTotal(ReviewVO vo) {
		System.out.println("===> mybatis로 getReviewListCnt() 기능 처리");
		return mybatis.selectOne("ReviewDAO.totalReviewListCnt", vo);

	}

}
