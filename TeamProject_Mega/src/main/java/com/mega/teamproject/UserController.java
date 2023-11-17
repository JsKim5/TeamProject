package com.mega.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDAO;

@Controller
public class UserController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/user.jsp/";
	
	dao.UserDAO user_dao;
	public void setUser_dao(dao.UserDAO user_dao) {
		this.user_dao = user_dao;
	}
			

	@RequestMapping(value={"/","/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/userInsert_Form.do")
	public String userInsert() {
		return VIEW_PATH + "JoinId.jsp";
	}
	
	//회원가입 처리
	
	//아이디 찾기 페이지
	@RequestMapping("/selectId_Form.do")
	public String selectId() {
		return VIEW_PATH + "IdForm_Form.";
	}
	
	
	//비밀번호 찾기 페이지
	@RequestMapping("/selectPw_form.do")
	public String selectPw() {
		return VIEW_PATH + "PwForm.jsp";
	}
	
	

}
