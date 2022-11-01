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
	
	//좋아요 등록
	@Override
	public void insertGood(GoodVO vo) {
		goodDAO.insertGood(vo);
	}


	//좋아요 순위 목록
	@Override
	public List<GoodVO> getGoodList() {
		return goodDAO.getGoodList();
	}


	//좋아요 체크
	@Override
	public GoodVO getGoodChk(GoodVO vo) {
		return goodDAO.getGoodChk(vo);
	}
	//좋아요 체크
	@Override
	public boolean getGoodYN(GoodVO vo) {
		return goodDAO.getGoodYN(vo);
		
	}

	//좋아요 삭제
	@Override
	public void deleteGood(GoodVO vo) {
		goodDAO.deleteGood(vo);
		
	}
	
}
