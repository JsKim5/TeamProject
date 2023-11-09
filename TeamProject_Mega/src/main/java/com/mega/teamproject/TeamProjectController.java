package com.mega.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import userdao.UserDAO;

@Controller
public class TeamProjectController {
	

	public static final String VIEW_PATH = "/WEB-INF/views/user.jsp/"; //user 폴더 이름 변경 가능
	
	UserDAO user_dao;
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
			

	@RequestMapping(value={"/","/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}

}
