package com.ticket.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.review.ReviewService;
import com.ticket.biz.review.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAOMybatis reviewDAO;
		
	@Override
	public void insertReview(ReviewVO vo) {
		System.out.println("review insert  serviceimpl 기능 처리 전");
		
		reviewDAO.insertReview(vo);
		System.out.println("review insert 기능 수행함 serviceimpl");
		
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		
		System.out.println("getReviewList service Impl기능 처리 " +vo.getReview_bno());
	return reviewDAO.getReviewList(vo);
	
	}

	@Override
	public int getTotal(ReviewVO vo) {
		return reviewDAO.getTotal(vo);
	
	}
	
	@Override
	public void deleteReview(ReviewVO vo) {
		System.out.println("delete Review service Impl 기능 처리");
		System.out.println("review delete serviceImpl wrtier값 받아오기" + vo.getReview_writer());
		reviewDAO.deleteReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		System.out.println("update review serviceImpl 기능 처리전");
		reviewDAO.updateReview(vo);
		
	}

	@Override
	public List<ReviewVO> myRecord(String review_writer) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
//
//	@Override
//	public List<ReviewVO> myRecord(String review_writer) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//



	

	
}
