package com.ticket.biz.couponbox;

import java.util.List;

public interface CouponBoxService {
	//CRUD 기능의 메소드 구현
		//쿠폰함등록
		void insertCouponBox(CouponBoxVO vo);

		//쿠폰사용
		void updateCouponBox(CouponBoxVO vo);


		//쿠폰 받은거 체크
		boolean getCouponBox(CouponBoxVO vo);

		//내쿠폰목록
		List<CouponBoxVO> myCouponList(CouponBoxVO vo);

		//쿠폰갯수
		int myCouponListCnt (CouponBoxVO vo);

}
