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
		
		System.out.println("getReviewList service Impl기능 처리 ");
	return reviewDAO.getReviewList(vo);
	
	}
//
//	@Override
//	public int getTotal(int review_bno) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<ReviewVO> myRecord(String review_writer) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void deleteReview(ReviewVO vo) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public List<ReviewVO> getReivewList(ReveiwVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int getTotal(int review_bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReviewVO> myRecord(String review_writer) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<ReviewVO> getReivewList(ReveiwVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public List<ReviewVO> getReviewList(String review_wrtier) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
