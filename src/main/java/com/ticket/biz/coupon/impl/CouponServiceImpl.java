package com.ticket.biz.coupon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.coupon.CouponService;
import com.ticket.biz.coupon.CouponVO;

@Service("couponService")
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDAO;

	@Override
	public void insertCoupon(CouponVO vo) {

		couponDAO.insertCoupon(vo);
	}

	@Override
	public void updateCoupon(CouponVO vo) {
		couponDAO.updateCoupon(vo);
	}

	@Override
	public void deleteCoupon(CouponVO vo) {
		couponDAO.deleteCoupon(vo);
	}

	@Override
	public List<CouponVO> getCouponList(CouponVO vo) {

		return couponDAO.getCouponList(vo);
	}

	@Override
	public int totalCouponListCnt(CouponVO vo) {

		return couponDAO.totalCouponListCnt(vo);
	}

	@Override
	public CouponVO getCoupon(CouponVO vo) {
		return couponDAO.getCoupon(vo);
	}



}
