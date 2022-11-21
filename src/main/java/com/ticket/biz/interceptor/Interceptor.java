package com.ticket.biz.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Interceptor implements HandlerInterceptor {
//	로그인체크 제외 리스트(수정 해야함)
	static final String[] EXCLUDE_URL_LIST = { 
//			"/local", 
//			"/login",
//			"/step1", 
//			"/insertMember",
//			"/index"
//			",/ranking",
//			"/getUserExhibitionList" ,
//			"/getCouponList", 
//			"/getBoardList",
//			"/getBoard","/getFaqList","/getOneList","/getOne"
//			,"/findIdform","/findPwform"
			
	};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURL().toString();
		System.out.println("reqUrl: " + reqUrl);

		for (String target : EXCLUDE_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				return true;
			}
		}

		HttpSession session= request.getSession();
		String userId= (String)session.getAttribute("md_Id");
		
		if(userId==null || userId.trim().equals("")) {
			session.invalidate();
			
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return false;
		}
		
		return true;
	}

}
