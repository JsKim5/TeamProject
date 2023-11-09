package com.mega.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import user_review_dao.urDAO;

@Controller
public class UserReviewController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/user_review/";
	
	urDAO ur_dao;
	
	public void setur_DAO(urDAO ur_dao) {
		this.ur_dao = ur_dao;
	}
	
	@RequestMapping(value = {"list.do"})
	
	public String list(Model model, String page) {
		
		//list.do?page=1
		//list.do?page=
		int nowPage = 1; //기본페이지
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		return VIEW_PATH + "user_review_list.jsp";
		
	}

}
