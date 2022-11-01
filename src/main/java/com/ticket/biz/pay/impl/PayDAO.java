package com.ticket.biz.pay.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.good.GoodVO;
import com.ticket.biz.pay.PayVO;


@Repository
public class PayDAO {

	@Autowired
    private	SqlSessionTemplate mybatis;

	//CRUD 메소드 구현
		//쿠폰등록
			public void insertPay(PayVO vo) {
				mybatis.insert("PayDAO.insertPay",vo);
			}
			//쿠폰수정
			public void updatePay(PayVO vo) {
				mybatis.update("PayDAO.updatePay",vo);
			}

			//쿠폰삭제
			public void deletePay(PayVO vo) {
				mybatis.delete("PayDAO.deletePay",vo);
			}

			//쿠폰목록 조회
			public List<PayVO> getPayList(PayVO vo) {
				return mybatis.selectList("PayDAO.getPayList",vo);
			}
			//전체 쿠폰 개수
			public int totalPayListCnt(PayVO vo) {
					return mybatis.selectOne("PayDAO.totalPayListCnt",vo);
			}
			public PayVO getPay(PayVO vo) {
				return (PayVO) mybatis.selectOne("PayDAO.getPay",vo);
			}
			//예매율 랭킹
			public List<GoodVO> getPayRank() {
				return mybatis.selectList("PayDAO.getPayRank");
			}
			//예매 전체 카운트
			public int getPayCnt() {
				return mybatis.selectOne("PayDAO.getPayCnt");
			}
		
}
