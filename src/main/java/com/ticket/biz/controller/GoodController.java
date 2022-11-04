package com.ticket.biz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Controller
@SessionAttributes("good")
public class GoodController {

	@Autowired
	private GoodService goodService;


	//좋아요 등록
	@RequestMapping(value = "/good_pick")
	public String insertGood(GoodVO vo,HttpSession session,HttpServletRequest request,Model model) throws IllegalStateException, IOException {
		String id=(String)session.getAttribute("mb_Id");
		int exh_no= vo.getExh_no();
		vo.setMb_id(id);
		vo= goodService.getGoodChk(vo);
		boolean yn=goodService.getGoodYN(vo);
		if(yn) {
				vo.setExh_no(exh_no);
				vo.setMb_id(id);
				goodService.deleteGood(vo);
				System.out.println("좋아요 제거");

		}
		else {
			System.out.println(exh_no+id);
			GoodVO insert_vo=new GoodVO();
			insert_vo.setMb_id(id);
			insert_vo.setExh_no(exh_no);
			goodService.insertGood(insert_vo);
			System.out.println("좋아요 등록");
		}
		return "forward:/getUserExhibitionList";
	}

	// 유저 좋아요 목록 조회
	@RequestMapping("/getMyGoodList")
	public String getUserExhibitionList(GoodVO vo, String nowPageBtn, Model model ,HttpSession session ) {
		//총 목록 수
				ExhibitionVO evo= new ExhibitionVO();
				vo.setMb_id((String)session.getAttribute("mb_Id"));
				int totalPageCnt = goodService.getMyGoodListCnt(vo);
				//현재 페이지 설정
				int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
				System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
				//한페이지당 보여줄 목록 수
				int onePageCnt = 10;
				//한 번에 보여질 버튼 수
				int oneBtnCnt = 5;

				PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
				vo.setOffset(pvo.getOffset());

				model.addAttribute("paging", pvo);
				model.addAttribute("getMyGoodList", goodService.getMyGoodList(vo));

				return "member/mygoodList";
	}

}
