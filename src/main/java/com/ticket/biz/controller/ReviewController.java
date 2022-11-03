package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.biz.review.ReviewService;
import com.ticket.biz.review.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewservice;
	
	@ResponseBody
	@RequestMapping("/insertReview")
	public String ReviewInsert(@RequestBody ReviewVO vo,HttpSession session) {
		System.out.println("review_writer"+vo.getReview_writer());
		System.out.println("review insert:컨트롤러 실행 ");
		if(session.getAttribute("mb_Id") == null) {
			System.out.println("아이디값 없음");
			return "fail";
		} else {
			System.out.println("insertReview 컨트롤러에서 로그인 확인 함");
			
			reviewservice.insertReview(vo);
			System.out.println("댓글 등록 서비스 성공 Controller");
			return "InsertSuccess";
		}
	}

	@ResponseBody
	@RequestMapping("/reviewList")
	public Map<String, Object> getReviewList(ReviewVO vo, Model model) {
		System.out.println("댓글 목록 컨트롤러 동작");
		System.out.println("bno"+vo.getReview_bno());
		System.out.println("writer"+vo.getReview_writer());
		
		System.out.println("toString"+vo.toString());
				List<ReviewVO> list = reviewservice.getReviewList(vo);
				System.out.println("getReviewList 실행후 컨트롤러 안 ");
		int bno =vo.getReview_bno();
		System.out.println("reviewList 실행 뒤 가져온 컨트롤러 안에서  bno"+bno);
		
		int total = reviewservice.getTotal(vo);
		System.out.println("bno1"+vo.getReview_bno());
		ModelAndView view = new ModelAndView();
		System.out.println("댓글 갯수 " + reviewservice.getTotal(vo));
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		view.setViewName("review");
		System.out.println("review list 가져오는 controller 다 탔음");
		return map;
	}
	
}