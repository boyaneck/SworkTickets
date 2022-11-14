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
		System.out.println(vo.getExh_no());
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
		/*송원선*/
		System.out.println("번호:"+vo.getReview_bno());
		/*송원선*/
//		System.out.println(request.getParameter("review_no"));
//		int val=0;
//		int ser=request.getParameter(list.review_no);
//		int nono=list.review_no;
//		System.out.println("val " +val);
		System.out.println("삭제하기 컨트롤러에서 list_no 받기!!!!" );
		System.out.println("컨트롤러 to string"+ vo.toString());
		System.out.println();
			reviewservice.deleteReview(vo);
			System.out.println("delete 컨트롤러 다 탔음");
			/*송원선*/
			return "redirect:getUserExhibition?exh_no="+vo.getReview_bno();
			/*송원선*/
	}

	
	//댓글 수정하기
	@RequestMapping("/updateReview")
	public String updateReview(ReviewVO vo, HttpSession session) {
		System.out.println("updateReview 컨트롤러 타기");
		System.out.println("전시회 상세번호");
		System.out.println("글번호 !!!!!!"+vo.getReview_no());
		reviewservice.updateReview(vo);
		System.out.println("전시상세번호출력!!! 댓글 수정에서 "+vo.getReview_bno());
	/*송원선*/
			return "redirect:getUserExhibition?exh_no="+vo.getReview_bno();
			/*송원선*/	
	}
	
	
	//댓글 목록 조회
	@ResponseBody
	@RequestMapping("/reviewList")
	public Map<String, Object> getReviewList(ReviewVO vo,String nowPageBtn, Model model) {
		
		
		int total = reviewservice.getTotal(vo);
		
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+total +", nowPage: "+nowPage);

		//한페이지당 보여줄 목록 수
		int onePageCnt = 5;

		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		
		
		System.out.println("페이징처리전 ");
		PagingVO pvo = new PagingVO(total, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		System.out.println("nowpage 찍혀라"+pvo.getNowPageBtn());
		List<ReviewVO> list = reviewservice.getReviewList(vo);
		
		
		ModelAndView view = new ModelAndView();
		
		System.out.println("오프셋출력!!!!!"+vo.getOffset());
		Map<String, Object> map = new HashMap<>();
		model.addAttribute("reviewList",list);
		model.addAttribute("paging", pvo);
		map.put("list", list);
		map.put("total", total);
		
		view.setViewName("reviewwrite");
		System.out.println(vo.getReview_bno());
		System.out.println("review list 가져오는 controller 다 탔음!!!!!!");
		
		
		return map;
	}
	
}