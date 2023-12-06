package com.mega.teamproject;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.UserDAO;
import vo.GameVO;
import vo.UserVO;

@Controller
public class UserController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;

	public static final String VIEW_PATH = "/WEB-INF/views/user/";

	UserDAO user_dao;

	public UserController(UserDAO user_dao) {
		this.user_dao = user_dao;
	}

	// 홈페이지,초기화면
	@RequestMapping(value = { "/", "/home.do" })
	public String homePage() {
		List<GameVO> mainList = user_dao.selectMain();
		request.setAttribute("mainList", mainList);
		return "/WEB-INF/views/MainPage.jsp";
	}

	// 회원가입 페이지 이동
	@RequestMapping("/join_form.do")
	public String insert_Form() {
		return VIEW_PATH + "JoinUser.jsp";
	}

	@RequestMapping("/join.do")
	// 회원가입 처리
	public String joinId(UserVO vo) {
		vo.setUser_ip(request.getRemoteAddr());// ip세팅
		user_dao.insert(vo);
		request.setAttribute("vo", vo);
		return "redirect:home.do";
	}

	// 아이디 찾기 페이지
	@RequestMapping("selectid_form.do")
	public String selectId_form(String fail) {
		if(fail != null && !fail.isEmpty()) {
			request.setAttribute("selectidfail", "아이디를 찾을 수 없습니다.\n이름이나 이메일을 확인해주세요");
		}
		return VIEW_PATH + "SelectId.jsp";
	}
	
	//아이디 찾기
	@RequestMapping("selectid.do")
	public String selectId(UserVO vo) {
		UserVO id = user_dao.selectId(vo);
		
		if(id != null) {
			
			request.setAttribute("id", id.getUser_id());
			request.setAttribute("name", id.getUser_name());
			
			return VIEW_PATH + "CheckId.jsp";
			
		}
		return "redirect:selectid_form.do?fail=o";
		
	}
	
	
	// 비밀번호 찾기 페이지
	@RequestMapping("selectpw_form.do")
	public String selectPw(String fail) {
		if(fail != null && !fail.isEmpty()) {
			request.setAttribute("selectpwfail", "비밀번호를 찾을 수 없습니다.\n이름, 아이디, 이메일을 확인해주세요");
		}
		return VIEW_PATH + "SelectPw.jsp";
	}
		
	//비밀번호 찾기
	@RequestMapping("selectpw.do")
	public String selectPw(UserVO vo) {
		UserVO pw = user_dao.selectPw(vo);
		
		if(pw != null) {
			request.setAttribute("pw", pw.getUser_pwd());
			
			return VIEW_PATH + "CheckPw.jsp";
		}
		return "redirect:selectpw_form.do?fail=o";
	}

	// 로그인 페이지
	@RequestMapping("/login_form.do")
	public String login_form(String fail) {
		if(fail != null && !fail.isEmpty()) {
			request.setAttribute("loginfail", "아이디 혹은 비밀번호를 확인해주세요");
		}
		return VIEW_PATH + "Login.jsp";
	}

	// 로그인 처리
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		UserVO login = user_dao.login(vo);

		if (login != null) {
			session.setAttribute("login", login);
			
			return "redirect:home.do";
		}
		return "redirect:login_form.do?fail=o";
	}
	
	//아이디 중복검사
	@RequestMapping("/checkid.do")
	@ResponseBody
	public String checkid(UserVO vo) {
		int res = user_dao.checkid(vo);
		if(res == 1 ) {
			return "no";
		}
		return "yes";
	}
	
	//아이디 중복검사
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public String checknickname(UserVO vo) {
		int res = user_dao.checknickname(vo);
		if(res == 1 ) {
			return "no";
		}
		return "yes";
	}

	// 마이페이지 이동
	@RequestMapping("/mypage.do")
	public String mypage_form() {
		return VIEW_PATH + "MyPage.jsp";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:home.do";
	}

	// 정보수정 페이지
	@RequestMapping("/modify_form.do")
	public String modify_form() {
		return VIEW_PATH + "Modify.jsp";
	}

	// 회원정보 수정(프로필 사진 변경)
	@RequestMapping("/modify_image.do")
	public String modify_image(UserVO vo, HttpSession session) {

		String webPath = "/resources/user_img/";
		String savePath = application.getRealPath(webPath);// 절대경로

		System.out.println("절대경로 : " + savePath);

		String filename = "no_file";

		MultipartFile user_img = vo.getUser_image();
		
		if (!user_img.isEmpty()) {

			filename = user_img.getOriginalFilename();

			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				user_img.transferTo(saveFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(filename);
		vo.setUser_image_path(filename);
		user_dao.image(vo);
		
		UserVO login = user_dao.login(vo);
		
		session.setAttribute("login", login);
		request.setAttribute("vo"/* + "" */, vo);// 바인딩
		
		return "redirect:mypage.do";

	}

	// 회원정보 수정
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(UserVO vo) {
		int res = user_dao.modify(vo);
		if(res == 0) {
			return "no";
		}
		return "yes";
	}

	// 회원탈퇴 페이지 이동
	@RequestMapping("/delete_form.do")
	public String delete_form() {
		return VIEW_PATH + "DeleteId.jsp";
	}

	// 회원탈퇴
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(UserVO vo) {
		int res = user_dao.delete(vo);
		
		if(res == 0 ) {
			return "no";
		}
		return "yes";
		
		
	 }
		
	 
}
