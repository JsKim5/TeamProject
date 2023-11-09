package com.mega.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import userdao.UserDAO;

@Controller
public class UserController {
	

	public static final String VIEW_PATH = "/WEB-INF/views/user.jsp/";
	
	UserDAO user_dao;
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
			

	@RequestMapping(value={"/","/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}

}
