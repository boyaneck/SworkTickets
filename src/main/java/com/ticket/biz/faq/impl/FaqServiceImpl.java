package com.ticket.biz.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ticket.biz.faq.FaqService;
import com.ticket.biz.faq.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDAOMybatis FaqDAO;

//	@Override
//	public void insertFaq(FaqVO vo) {
//		
//		
//	}

//	@Override
//	public void deleteFaq(FaqVO vo) {
//		
//	}
//
//	@Override
//	public void updateFaq(FaqVO vo) {
//	
//	}
//
//	@Override
//	public FaqVO getFaq(FaqVO vo) {
//		
//		return FaqDAO.
//	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
	
		return FaqDAO.getFaqList(vo);
	}

	@Override
	public int totalFaqListCnt(FaqVO vo) {
				return FaqDAO.totalFaqListCnt(vo);
	}

//	@Override
//	public void deleteFaq(FaqVO vo) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void updateFaq(FaqVO vo) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public FaqVO getFaq(FaqVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	

}
