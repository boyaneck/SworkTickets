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
			public void insertPay(PayVO vo) {
				mybatis.insert("PayDAO.insertPay",vo);
			}
			// 취소 여부
			public void updatePay(PayVO vo) {
				mybatis.update("PayDAO.updatePay",vo);
			}
			// 관람여부
			public void updatePay1(PayVO vo) {
				mybatis.update("PayDAO.updatePay1",vo);
			}

			public void deletePay(PayVO vo) {
				mybatis.delete("PayDAO.deletePay",vo);
			}

			public List<PayVO> getPayList(PayVO vo) {
				return mybatis.selectList("PayDAO.getPayList",vo);
			}
			public List<PayVO> getAllPayList(PayVO vo) {
				return mybatis.selectList("PayDAO.getAllPayList",vo);
			}

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
			//리뷰 예매 체크
			public int reviewPayCheck(PayVO vo) {
				return mybatis.selectOne("PayDAO.reviewPayCheck",vo);
			}

}
