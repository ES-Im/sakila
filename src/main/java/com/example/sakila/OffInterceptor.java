package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component 
public class OffInterceptor implements HandlerInterceptor {

	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//log.debug(request.getRequestURL().toString() + "reqeust intercepted");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginStaff")!=null) {
			response.sendRedirect(request.getContextPath() + "/on/main.jsp");
		
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}


}
