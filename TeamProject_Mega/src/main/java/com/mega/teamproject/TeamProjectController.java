package com.mega.teamproject;

import org.springframework.stereotype.Controller;

import userdao.UserDAO;

@Controller
public class TeamProjectController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/user/"; //user 폴더 이름 변경 가능
	
	UserDAO user_dao;
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
			
}
