package com.ticket.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.couponbox.CouponBoxService;
import com.ticket.biz.couponbox.CouponBoxVO;

@Controller
@SessionAttributes("couponbox")
public class CouponBoxController {

	@Autowired
	private CouponBoxService couponBoxService;
	//쿠폰 등록
	@GetMapping(value = "/insertCouponBox")
	public String insertCoupon(CouponBoxVO vo,HttpSession session, HttpServletResponse response) throws IllegalStateException, IOException {
		vo.setMb_id((String)session.getAttribute("mb_Id"));
		boolean a=couponBoxService.getCouponBox(vo);
		if(a) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('이미 받은 쿠폰입니다');history.back();</script>");
            out.flush();

		}
		else {
		couponBoxService.insertCouponBox(vo);
		return "redirect:getCouponList";
		}
		return "redirect:getCouponList";
	}

	// 내쿠폰목록
	@RequestMapping("/MyCoupon")
	public String getCouponListPost(CouponBoxVO vo, String nowPageBtn, Model model ,HttpSession session) {
		vo.setMb_id((String)session.getAttribute("mb_Id"));
		//총 목록 수
		int totalPageCnt = couponBoxService.myCouponListCnt(vo);
		//현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String today = sdf.format(now);


		model.addAttribute("today",today);
		model.addAttribute("paging", pvo);
		model.addAttribute("couponList", couponBoxService.myCouponList(vo));
		return "coupon/myCouponList";
	}



	}



