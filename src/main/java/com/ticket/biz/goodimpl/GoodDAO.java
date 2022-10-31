package com.ticket.biz.goodimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.good.GoodVO;

@Repository
public class GoodDAO {


	@Autowired
    private	SqlSessionTemplate mybatis;
	
	//좋아요등록
	public void insertGood(GoodVO vo) {
		mybatis.insert("GoodDAO.insertGood",vo);
	}
	//좋아요수정
	public void updateGood(GoodVO vo) {
		mybatis.update("GoodDAO.updateGood",vo);
	}
	//좋아요목록
	public List<GoodVO> getGoodList(GoodVO vo) {
		return mybatis.selectList("GoodDAO.GoodList",vo);
	}
	//좋아요개수
	public int GoodCnt(GoodVO vo) {
		return mybatis.selectOne("GoodDAO.GoodCnt",vo);
	}
	//좋아요체크
	public GoodVO getGoodChk(GoodVO vo) {
		return mybatis.selectOne("GoodDAO.getGoodChk",vo);
	}
	//좋아요체크
	public boolean getGoodYN(GoodVO vo) {
		int cnt=mybatis.selectOne("GoodDAO.getGoodYN",vo);
		if(cnt==0) {
		return false;
		}
		else 
		{return true;
		}
	}
}
