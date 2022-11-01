package com.ticket.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;

@Controller
@SessionAttributes("good")
public class RankController {

	@Autowired
	private GoodService goodService;
	
	// 전시 목록 조회
		@RequestMapping("/ranking")
		public String getExhibitionList(ExhibitionVO vo, Model model, HttpSession session) {
					goodService.getGoodList();
					model.addAttribute("getGoodList", goodService.getGoodList());
					return "ranking/ranking";
		}

	
	
	
	
	
	
	
	
}

