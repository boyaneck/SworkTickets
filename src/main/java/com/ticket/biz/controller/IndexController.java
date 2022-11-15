package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticket.biz.exhibition.ExhibitionService;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;
import com.ticket.biz.pay.PayService;
import com.ticket.biz.review.ReviewVO;

@Controller
public class IndexController {
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@Autowired
	private GoodService goodService;

	@Autowired
	private PayService payService;
	
	@ResponseBody
	@RequestMapping(value = "/index")
	public Map<String, Object> getAllExhibitionList(ExhibitionVO vo, Model model, HttpSession session) {
		
		double ptotal= payService.getPayCnt();
		
		List<ExhibitionVO> elist = exhibitionService.getExhibitionList(vo);
		List<GoodVO> rlist = payService.getPayRank();
		List<GoodVO> glist = goodService.getGoodList();
		
		Map<String, Object> map = new HashMap<>();
		
		
System.out.println("4545454554");
//		model.addAttribute("total",total);
		model.addAttribute("payRankList", payService.getPayRank());
		model.addAttribute("getGoodList", goodService.getGoodList());
		model.addAttribute("exhibitionList", exhibitionService.getExhibitionList(vo));
		map.put("elist", exhibitionService.getUserExhibitionList(vo));
		map.put("rlist", payService.getPayRank());
		map.put("glist", goodService.getGoodList());
		map.put("ptotal", ptotal);
		
		return map;

}


}
