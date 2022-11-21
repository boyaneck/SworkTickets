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
		
		reviewDAO.insertReview(vo);
		
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		
	return reviewDAO.getReviewList(vo);
	
	
	}

	@Override
	public int getTotal(ReviewVO vo) {
		return reviewDAO.getTotal(vo);
	
	}
	
	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
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
