package com.ticket.biz.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Interceptor implements HandlerInterceptor{
//	로그인체크 제외 리스트(수정 해야함)
		static final String[] EXCLUDE_URL_LIST= {
				"/login", "/step1","/insertMember","/index", "/ranking", "/getUserExhibitionList"
		};
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl= request.getRequestURL().toString();
		System.out.println("reqUrl: "+reqUrl);

		for(String target :EXCLUDE_URL_LIST) {
			if(reqUrl.indexOf(target)>-1) {
				return true;
			}
		}

		HttpSession session= request.getSession();
		String userId= (String)session.getAttribute("mb_Id");

		if(userId==null || userId.trim().equals("")) {
			session.invalidate();

			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return false;
		}
		else if(request.getContextPath().contains("/updateBoard")|| request.getContextPath().contains("/deleteBoard")) {
			if(!(request.getParameter("writer").equals(session.getAttribute("mb_Id").toString()) )) {
				System.out.println("수정삭제인터셉터");
				response.sendRedirect("getBoard.do?error=1&seq="+request.getParameter("seq"));
				return false;
			}
		}
		return true;
	}

}
