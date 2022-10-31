package com.ticket.biz.couponbox.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticket.biz.couponbox.CouponBoxVO;


@Repository
public class CouponBoxDAO {

	@Autowired
    private	SqlSessionTemplate mybatis;

	//CRUD 메소드 구현
			//쿠폰받기
			public void insertCouponBox(CouponBoxVO vo) {
				mybatis.insert("CouponBoxDAO.insertCouponBox",vo);
			}

			//쿠폰사용
			public void updateCouponBox(CouponBoxVO vo) {
				// TODO Auto-generated method stub
				mybatis.update("CouponBoxDAO.updateCouponBox",vo);
			}
			//쿠폰체크
			public int getCouponBox(CouponBoxVO vo) {
				return mybatis.selectOne("CouponBoxDAO.getCouponBox",vo);
			}
			//내쿠폰
			public List<CouponBoxVO> myCouponList(CouponBoxVO vo) {
				return mybatis.selectList("CouponBoxDAO.myCouponList",vo);
			}
			//내쿠폰 개수
			public int myCouponListCnt(CouponBoxVO vo) {
				return mybatis.selectOne("CouponBoxDAO.myCouponListCnt",vo);
			}

}
