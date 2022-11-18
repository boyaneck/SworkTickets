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

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.pay.PayService;
import com.ticket.biz.pay.PayVO;
import com.ticket.biz.review.ReviewService;
import com.ticket.biz.review.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewservice;
	@Autowired
	private PayService payService;

	// 댓글 등록 하기
	@ResponseBody
	@RequestMapping("/insertReview")
	public String ReviewInsert(@RequestBody ReviewVO vo, HttpSession session, Model model, PayVO pvo) {
		if (session.getAttribute("mb_Id") == null) {
			return "fail";
		} else {
			int exh_no = vo.getReview_bno();
			
		
			pvo.setExh_no(exh_no);
			pvo.setMb_id((String) session.getAttribute("mb_Id"));
			System.out.println(pvo.toString());
			if (payService.reviewPayCheck(pvo) > 0) {
				
				reviewservice.insertReview(vo);
				model.addAttribute("reviewmodel", vo);

				return "InsertSuccess";
			} else {
				return "fail";
			}
		}
	}

//	//댓글 삭제하기
	@RequestMapping("/deleteReview")
	public String deleteReview(ReviewVO vo, HttpSession session, HttpServletRequest request) {
//		int val=0;
//		int ser=request.getParameter(list.review_no);
//		int nono=list.review_no;
		reviewservice.deleteReview(vo);
		/* 송원선 */
		return "redirect:getUserExhibition?exh_no=" + vo.getReview_bno();
		/* 송원선 */
	}

	// 댓글 수정하기
	@RequestMapping("/updateReview")
	public String updateReview(ReviewVO vo, HttpSession session) {
		reviewservice.updateReview(vo);
		/* 송원선 */
		return "redirect:getUserExhibition?exh_no=" + vo.getReview_bno();
		/* 송원선 */
	}

	// 댓글 목록 조회

	@ResponseBody
	@RequestMapping("/reviewList")
	public Map<String, Object> getReviewList(ReviewVO vo, String nowPageBtn, Model model) {

		int total = reviewservice.getTotal(vo);

		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 5;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(total, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		List<ReviewVO> list = reviewservice.getReviewList(vo);

		ModelAndView view = new ModelAndView();

		Map<String, Object> map = new HashMap<>();
		model.addAttribute("reviewList", list);
		model.addAttribute("paging", pvo);
		map.put("paging", pvo);
		map.put("list", list);
		map.put("total", total);

		view.setViewName("reviewwrite");

		return map;
	}

}