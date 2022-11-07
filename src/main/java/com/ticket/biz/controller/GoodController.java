package com.ticket.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Controller
public class GoodController {
	
	@Autowired
	GoodService goodService;
	
	
	
	@GetMapping("/good")
	public String gd(GoodVO vo, Model model ) { 
		model.addAttribute("goodlist", goodService.getGoodList());
		
		return "good";
	}
	
	@RequestMapping(value="/insertGood", method=RequestMethod.POST)
	@ResponseBody
	public int md(GoodVO vo, HttpSession session) {
		String id = (String) session.getAttribute("mb_Id");
		vo.setMb_id(id);
		int row = goodService.insertGood(vo);
		return row;
	}
	
	@RequestMapping(value="/deleteGood", method=RequestMethod.POST)
	@ResponseBody
	public int dl(GoodVO vo, HttpSession session) {
		String id = (String) session.getAttribute("mb_Id");
		vo.setMb_id(id);
		int row = goodService.deleteGood(vo);
		return row;
	}
	
	@GetMapping("/getGoodList")
	public String getGoodList( ) {
		goodService.getGoodList();
		return "redirect:getUserExhibitionList";
	}
	// 유저 좋아요 목록 조회
	   @RequestMapping("/getMyGoodList")
	   public String getUserExhibitionList(GoodVO vo, String nowPageBtn, Model model ,HttpSession session ) {
	      //총 목록 수
	            ExhibitionVO evo= new ExhibitionVO();
	            vo.setMb_id((String)session.getAttribute("mb_Id"));
	            System.out.println("컨트롤 아이디: "+vo.getMb_id());
	            int totalPageCnt = goodService.getMyGoodListCnt(vo);
	            System.out.println("totalpageCnt: "+totalPageCnt);
	            //현재 페이지 설정
	            int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
	            System.out.println("nowPage: "+nowPage);
	            //한페이지당 보여줄 목록 수
	            int onePageCnt = 10;
	        
	            //한 번에 보여질 버튼 수
	            int oneBtnCnt = 5;
	            System.out.println("oneBtnCnt: " +oneBtnCnt);
	            PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
	            vo.setOffset(pvo.getOffset());
	            model.addAttribute("paging", pvo);
	            System.out.println("여기까지 실행완료");
	            
	            List<ExhibitionVO> a= goodService.getMyGoodList(vo);
	            for(ExhibitionVO k  :a) {
	            	System.out.println("k: "+k);
	            }
	            
	            
	            model.addAttribute("getMyGoodList",a);
	           
	            System.out.println("여기까지 실행되길바람");
	            return "member/mygoodList";
	   }
}