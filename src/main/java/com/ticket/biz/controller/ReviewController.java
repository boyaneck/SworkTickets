package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	
	
	
	//댓글 등록 하기 
	@ResponseBody
	@RequestMapping("/insertReview")
	public String ReviewInsert(@RequestBody ReviewVO vo,HttpSession session, Model model) {
		System.out.println("review_writer"+vo.getReview_writer());
		System.out.println("review insert:컨트롤러 실행 ");
		if(session.getAttribute("mb_Id") == null) {
			System.out.println("아이디값 없음");
			return "fail";
		} else {
			System.out.println("insertReview 컨트롤러에서 로그인 확인 함");
			
			reviewservice.insertReview(vo);
			System.out.println("댓글 등록 서비스 성공 Controller");
			System.out.println("review_writer" +vo.getReview_writer());
			model.addAttribute("reviewmodel", vo);
			return "InsertSuccess";
		}
	}
	
	
//	//댓글 삭제하기
	@RequestMapping("/deleteReview")
	public String deleteReview(ReviewVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("deleteReview 기능 처리 전");
//		System.out.println(request.getParameter("review_no"));
//		int val=0;
//		int ser=request.getParameter(list.review_no);
//		int nono=list.review_no;
//		System.out.println("val " +val);
		System.out.println("삭제하기 컨트롤러에서 list_no 받기!!!!" );
		System.out.println("컨트롤러 to string"+ vo.toString());
			reviewservice.deleteReview(vo);
			System.out.println("delete 컨트롤러 다 탔음");
			return "redirect:reviewwrite.jsp";
	}

	
	//댓글 수정하기
	@RequestMapping("/updateReview")
	public String updateReview(ReviewVO vo, HttpSession session) {
		System.out.println("updateReview 컨트롤러 타기");
		
		reviewservice.updateReview(vo);
		
	
			return "redirect:reviewwrite.jsp";
		
	}
	
	
	
	
	//댓글 목록 조회
	@ResponseBody
	@RequestMapping("/reviewList")
	public Map<String, Object> getReviewList(ReviewVO vo, Model model) {
		System.out.println("댓글 목록 컨트롤러 동작");
		System.out.println("bno"+vo.getReview_bno());
		System.out.println("writer"+vo.getReview_writer());
		
		
//		System.out.println("toString"+reviewList.toString());
				List<ReviewVO> list = reviewservice.getReviewList(vo);
				
				System.out.println("getReviewList 실행후 컨트롤러 안  그리고 list toString" +list.toString());


		
		int total = reviewservice.getTotal(vo);
		ModelAndView view = new ModelAndView();
		System.out.println("댓글 갯수 " + reviewservice.getTotal(vo));
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
//		map.put("reviewlist",reviewList);
		view.setViewName("reviewwrite");
		System.out.println("review list 가져오는 controller 다 탔음");
		
		return map;
	}
	
}