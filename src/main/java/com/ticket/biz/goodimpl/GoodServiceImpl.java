package com.ticket.biz.goodimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Service("GoodService")
public class GoodServiceImpl implements GoodService {

	@Autowired
	GoodDAO goodDAO;

	// 좋아요 등록
	@Override
	public int insertGood(GoodVO vo) {
		return goodDAO.insertGood(vo);
	}

	// 좋아요 순위 목록
	@Override
	public List<GoodVO> getGoodList() {
		return goodDAO.getGoodList();
	}

	// 좋아요 삭제
	@Override
	public int deleteGood(GoodVO vo) {
		return goodDAO.deleteGood(vo);

	}

	@Override
	public int getMyGoodListCnt(GoodVO vo) {
		return goodDAO.getMyGoodListCnt(vo);
	}

	@Override
	public List<ExhibitionVO> getMyGoodList(GoodVO vo) {

		return goodDAO.getMyGoodList(vo);
	}

	// 좋아요 체크
	@Override
	public GoodVO getGoodChk(GoodVO vo) {
		return goodDAO.getGoodChk(vo);
	}

	// 좋아요 체크
	@Override
	public boolean getGoodYN(GoodVO vo) {
		return goodDAO.getGoodYN(vo);

	}

}
