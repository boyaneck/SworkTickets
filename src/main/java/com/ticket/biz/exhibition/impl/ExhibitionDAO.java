package com.ticket.biz.exhibition.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.exhibition.ExhibitionVO;

@Repository
public class ExhibitionDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 전시 등록
	public void insertExhibition(ExhibitionVO vo) {
		System.out.println("insertExhibition mybatis");
		mybatis.insert("ExhibitionDAO.insertExhibition", vo);
	}

	// 전시 승인
	public void approvalExhibition(ExhibitionVO vo) {
		mybatis.update("ExhibitionDAO.approvalExhibition", vo);
	}
	
	// 전시 수정
	public void updateExhibition(ExhibitionVO vo) {
		mybatis.update("ExhibitionDAO.updateExhibition", vo);
	}

	// 전시 삭제
	public void deleteExhibition(ExhibitionVO vo) {
		mybatis.delete("ExhibitionDAO.deleteExhibition", vo);
	}

	// 전시 상세 조회
	public ExhibitionVO getExhibition(ExhibitionVO vo) {
		return (ExhibitionVO)mybatis.selectOne("ExhibitionDAO.getExhibition", vo);
	}

	// 전시 목록 조회
	public List<ExhibitionVO> getExhibitionList(ExhibitionVO vo) {
		return mybatis.selectList("ExhibitionDAO.getExhibitionList",vo);
	}

	// 전시 목록 개수 조회
	public int totalExhibitionListCnt(ExhibitionVO vo) {
		return mybatis.selectOne("ExhibitionDAO.totalExhibitionListCnt", vo);
	}

	// 전시 번호 최대값
	public int getMaxExhibition(ExhibitionVO vo) {
		return mybatis.selectOne("ExhibitionDAO.getMaxExhibition", vo);
	}
	
	// 유저 전시 목록 조회
	public List<ExhibitionVO> getUserExhibitionList(ExhibitionVO vo) {
		return mybatis.selectList("ExhibitionDAO.getUserExhibitionList",vo);
	}

	// 전시 목록 개수 조회
	public int totalUserExhibitionListCnt(ExhibitionVO vo) {
		return mybatis.selectOne("ExhibitionDAO.totalUserExhibitionListCnt", vo);
		}
	
	// 유저 전시 검색
	public List<ExhibitionVO> searchUserExhibitionList(ExhibitionVO vo) {
		return mybatis.selectList("ExhibitionDAO.searchUserExhibitionList",vo);
	}
	
	// 유저 전시 검색 개수 조회
	public int totalsearchUserExhibitionListCnt(ExhibitionVO vo) {
		return mybatis.selectOne("ExhibitionDAO.totalsearchUserExhibitionListCnt", vo);
	}


}
