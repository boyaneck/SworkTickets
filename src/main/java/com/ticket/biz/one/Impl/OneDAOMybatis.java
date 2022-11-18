package com.ticket.biz.one.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.one.OneVO;

@Repository
public class OneDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

     //CRUD 기능

	//글 등록
	public void insertOne(OneVO vo) {
		mybatis.insert("OneDAO.insertOne",vo);
	}
	// 글 삭제
	public void deleteOne(OneVO vo) {
		mybatis.delete("OneDAO.deleteOne", vo);
	}

	// 글 수정
	public void updateOne(OneVO vo) { 
		mybatis.update("OneDAO.updateOne",vo);
	}

	//글 상세보기
	public OneVO getOne(OneVO vo) {
	 return (OneVO)mybatis.selectOne("OneDAO.getOne", vo);
	}

	//글 목록 조회
	public List<OneVO> getOneList(OneVO vo){
	return mybatis.selectList("OneDAO.getOneList", vo);
	}


	//전체글 목록 갯수
	 public int totalOneListCnt(OneVO vo) {
	return mybatis.selectOne("OneDAO.totalOneListCnt",vo);
	 }
	 
	//관리자가 1:1 문의 답변 달기
	 public void doAnswer(OneVO vo) {
		mybatis.update("OneDAO.oneAnswer",vo);
	 }
}
