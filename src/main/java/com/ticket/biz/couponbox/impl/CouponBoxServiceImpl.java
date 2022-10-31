package com.ticket.biz.couponbox.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.couponbox.CouponBoxService;
import com.ticket.biz.couponbox.CouponBoxVO;

@Service("couponBoxService")
public class CouponBoxServiceImpl implements CouponBoxService {

	@Autowired
	private CouponBoxDAO couponDAO;

	//쿠폰받기
	@Override
	public void insertCouponBox(CouponBoxVO vo) {
		couponDAO.insertCouponBox(vo);
	}


	//쿠폰사용
	@Override
	public void updateCouponBox(CouponBoxVO vo) {
		couponDAO.updateCouponBox(vo);
	}

	//쿠폰체크
	@Override
	public boolean getCouponBox(CouponBoxVO vo) {
		boolean check= false;
		int a=couponDAO.getCouponBox(vo);
		if(a!=0) {
			 check=true;
			return check;
		 }else {
			 return check;
		 }
	}

	//내쿠폰목록
	@Override
	public List<CouponBoxVO> myCouponList(CouponBoxVO vo) {
		return couponDAO.myCouponList(vo);
	}


	@Override
	public int myCouponListCnt(CouponBoxVO vo) {
		return couponDAO.myCouponListCnt(vo);
	}
}
