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
	public int insertGood(GoodVO vo) {
		return mybatis.insert("GoodDAO.insertGood",vo);
	}
	//좋아요삭제
	public int deleteGood(GoodVO vo) {
		return mybatis.delete("GoodDAO.deleteGood",vo);
	}
	
	//좋아요 순위 목록
	public List<GoodVO> getGoodList() {
		return mybatis.selectList("GoodDAO.getGoodList");
	}
	
	public List<ExhibitionVO> getMyGoodList(GoodVO vo) {
	return mybatis.selectList("GoodDAO.getMyGoodList", vo);
	}
	
	public int getMyGoodListCnt(GoodVO vo) {
		System.out.println("마이바티스 실행");
		System.out.println(vo.toString());
		return mybatis.selectOne("GoodDAO.getMyGoodListCnt", vo);
	}
}




