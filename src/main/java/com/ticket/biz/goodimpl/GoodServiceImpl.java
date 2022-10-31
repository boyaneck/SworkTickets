package com.ticket.biz.goodimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Service("GoodService")
public class GoodServiceImpl implements GoodService{

	@Autowired
	private GoodDAO goodDAO;
	
	@Override
	public void insertGood(GoodVO vo) {
		goodDAO.insertGood(vo);
	}

	@Override
	public void updateGood(GoodVO vo) {
		goodDAO.updateGood(vo);
	}

	@Override
	public List<GoodVO> getGoodList(GoodVO vo) {
		return goodDAO.getGoodList(vo);
	}

	@Override
	public int GoodCnt(GoodVO vo) {
		return goodDAO.GoodCnt(vo);
	}

	@Override
	public GoodVO getGoodChk(GoodVO vo) {
		return goodDAO.getGoodChk(vo);
	}

	@Override
	public boolean getGoodYN(GoodVO vo) {
		return goodDAO.getGoodYN(vo);
		
	}
	
}
