package com.ticket.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticket.biz.member.impl.PhoneService;

@Controller
public class PhoneController {
	@Autowired
	PhoneService phoneService;

	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("mb_phone") String userPhoneNumber) {
		System.out.println(userPhoneNumber);
		System.out.println("휴대폰으로 보낼 인증번호 난수 생성");
		//난수 4자리수 생성
//		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		//난수 6자리수 생성
		int randomNumber = (int)Math.floor((Math.random()*(999999-100000+1)+100000));
		//난수 생성
		phoneService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}

}
