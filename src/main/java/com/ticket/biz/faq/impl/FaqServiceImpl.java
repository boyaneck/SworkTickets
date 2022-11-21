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

	@Override
	public void insertFaq(FaqVO vo) {
		FaqDAO.insertFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		FaqDAO.deleteFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
			FaqDAO.updateFaq(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {

		return FaqDAO.getFaq(vo);
	}

	@Override
	public FaqVO adminFaq(FaqVO vo) {

		return FaqDAO.adminFaq(vo);
	}
	
	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {

		return FaqDAO.getFaqList(vo);
	}

	@Override
	public int totalFaqListCnt(FaqVO vo) {
				return FaqDAO.totalFaqListCnt(vo);
	}

	@Override
	public List<FaqVO> adminFaqList(FaqVO vo) {
		
		return FaqDAO.adminFaqList(vo);
	}

	@Override
	public int totaladminFaqListCnt(FaqVO vo) {
		return FaqDAO.totaladminFaqListCnt(vo);
	}






}
