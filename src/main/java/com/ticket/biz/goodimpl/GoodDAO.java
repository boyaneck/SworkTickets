package com.ticket.biz.goodimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodVO;

@Repository
public class GoodDAO {


	@Autowired
    private	SqlSessionTemplate mybatis;

	//좋아요등록
	public void insertGood(GoodVO vo) {
		mybatis.insert("GoodDAO.insertGood",vo);
	}
	//좋아요삭제
	public void deleteGood(GoodVO vo) {
		mybatis.delete("GoodDAO.deleteGood",vo);
	}

	//좋아요 순위 목록
	public List<GoodVO> getGoodList() {
		return mybatis.selectList("GoodDAO.getGoodList");
	}

	//좋아요체크
	public GoodVO getGoodChk(GoodVO vo) {
		return mybatis.selectOne("GoodDAO.getGoodChk",vo);
	}
	//좋아요체크
	public boolean getGoodYN(GoodVO vo) {
		int cnt=mybatis.selectOne("GoodDAO.getGoodYN",vo);
		if(cnt==0) {
		return false;}
		else {
			return true;}
	}

	// 유저 전시 목록 조회
	public List<ExhibitionVO> getMyGoodList(GoodVO vo) {
		return mybatis.selectList("GoodDAO.getMyGoodList",vo);
	}
	// 유저 전시 목록 조회 카운트
	public int getMyGoodListCnt(GoodVO vo) {
		return mybatis.selectOne("GoodDAO.getMyGoodListCnt",vo);
	}
}
