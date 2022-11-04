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
		System.out.println("One insert 기능 처리 전");
		mybatis.insert("OneDAO.insertOne",vo);
		System.out.println("One insert 기능 수행함");
	}
	// 글 삭제
	public void deleteOne(OneVO vo) {
		System.out.println("one delete 기능 처리 전");
		mybatis.delete("OneDAO.deleteOne", vo);
		System.out.println("One delete 기능 수행함");
	}

	// 글 수정
	public void updateOne(OneVO vo) {
		System.out.println("update one 기능 처리 전");
		mybatis.update("OneDAO.updateOne",vo);
		System.out.println("One update 기능 수행함");
	}

	//글 상세보기
	public OneVO getOne(OneVO vo) {
		System.out.println("Getone 기능 처리 전");
	 return (OneVO)mybatis.selectOne("OneDAO.getOne", vo);
	}

	//글 목록 조회
	public List<OneVO> getOneList(OneVO vo){
		System.out.println("getOneList 기능 처리 전 ");


		return mybatis.selectList("OneDAO.getOneList", vo);
		}


	//전체글 목록 갯수
		 public int totalOneListCnt(OneVO vo) {
			 System.out.println("===> mybatis로 getOneListCnt() 기능 처리");
			 return mybatis.selectOne("OneDAO.totalOneListCnt",vo);

		 }
}
