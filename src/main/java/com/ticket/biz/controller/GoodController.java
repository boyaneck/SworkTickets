package com.ticket.biz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Controller
@SessionAttributes("good")
public class GoodController {

	@Autowired
	private GoodService goodService;


	//좋아요 등록
	@RequestMapping(value = "/good_pick")
	public String insertGood(GoodVO vo,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
		String id=(String)session.getAttribute("mb_Id");
		int exh_no= vo.getExh_no();
		vo.setMb_id(id);
		vo= goodService.getGoodChk(vo);
		boolean yn=goodService.getGoodYN(vo);
		
		if(yn==true) {
			if(vo.getGood_check()==0) {
				vo.setGood_check(1);
				vo.setMb_id(id);
				goodService.updateGood(vo);
				System.out.println("수정1");
			}else {
				vo.setGood_check(0);
				vo.setMb_id(id);
				goodService.updateGood(vo);

				System.out.println("수정0");
			}
		}
		else {
			System.out.println(exh_no+id);
			GoodVO insert_vo=new GoodVO();
			insert_vo.setMb_id(id);
			insert_vo.setExh_no(exh_no);
			goodService.insertGood(insert_vo);
			System.out.println("좋아요 등록");
		}
		return "redirect:getUserExhibitionList";
	}
	
}
