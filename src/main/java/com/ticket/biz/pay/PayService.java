package com.ticket.biz.pay;

import java.util.List;

import com.ticket.biz.good.GoodVO;

public interface PayService {
	//CRUD 기능의 메소드 구현
		void insertPay(PayVO vo);
		// 취소여부
		void updatePay(PayVO vo);
		// 관람여부
		void updatePay1(PayVO vo);

		void deletePay(PayVO vo);

		List<PayVO> getPayList(PayVO vo);

		List<PayVO> getAllPayList(PayVO vo);

		int totalPayListCnt (PayVO vo);

		int reviewPayCheck(PayVO vo);
		
		PayVO getPay(PayVO vo);

		
		//예매율 조회
		List<GoodVO> getPayRank();
		//예매 전체 카운트
		int getPayCnt();
}
