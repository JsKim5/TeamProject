package com.mega.teamproject;


import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDAO;
import vo.UserVO;



@Controller
public class UserController {
	
	@Autowired
	HttpServletRequest request;
	
	public static final String VIEW_PATH = "/WEB-INF/views/user/";
	
	dao.UserDAO user_dao;
	public void setUser_dao(dao.UserDAO user_dao) {
		this.user_dao = user_dao;
	}
			

	@RequestMapping(value={"/","/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/join_Form.do")
	public String insert_Form() {
		return VIEW_PATH + "JoinUser.jsp";
	}
	
	@RequestMapping("/join.do")
	//회원가입 처리
	public String joinId( UserVO vo) {
		vo.setUser_ip( request.getRemoteAddr() );//ip세팅
		user_dao.insert(vo);
		return "redirect:home.do";
	}

	//아이디 찾기 페이지
	@RequestMapping("/selectId.do")
	public String selectId() {
		return VIEW_PATH + "SearchId.jsp";
	}
	
	
	//비밀번호 찾기 페이지
	@RequestMapping("/selectPw.do")
	public String selectPw() {
		return VIEW_PATH + "SearchPw.jsp";
	}
	
	//로그인 페이지
	@RequestMapping("/login.do")
	public String login() {
		return VIEW_PATH + "Login.jsp";
	}

}