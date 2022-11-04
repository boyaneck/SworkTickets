package com.ticket.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.pay.PayService;

@Controller
@SessionAttributes({"good","pay"})
public class RankController {

	@Autowired
	private GoodService goodService;

	@Autowired
	private PayService payService;

	// 전시 목록 조회
		@RequestMapping("/ranking")
		public String getExhibitionList(ExhibitionVO vo, Model model, HttpSession session) {
					double total= payService.getPayCnt();

					model.addAttribute("total",total);
					model.addAttribute("payRankList", payService.getPayRank());
					model.addAttribute("getGoodList", goodService.getGoodList());
					return "ranking/ranking";

//					예매율(%) =>(해당전시카운트 % 전체카운트) * 100
		}









}

