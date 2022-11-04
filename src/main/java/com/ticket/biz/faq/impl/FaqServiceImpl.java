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
		System.out.println("insertFaq  Serviceimpl 에서 실행전");
		System.out.println("faq_title"+ vo.getFaq_title());
		FaqDAO.insertFaq(vo);
		System.out.println("isnert Faq serviceimpl 에서 실행 후 ");
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		System.out.println("deleteFaq  Serviceimpl 에서 실행전");
		FaqDAO.deleteFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		System.out.println("updateFaq  Serviceimpl 에서 실행전");
			FaqDAO.updateFaq(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {

		return FaqDAO.getFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {

		return FaqDAO.getFaqList(vo);
	}

	@Override
	public int totalFaqListCnt(FaqVO vo) {
				return FaqDAO.totalFaqListCnt(vo);
	}






}
