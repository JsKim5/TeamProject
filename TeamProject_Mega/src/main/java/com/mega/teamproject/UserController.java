package com.mega.teamproject;


<<<<<<< HEAD
=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> branch 'main' of https://github.com/JsKim5/TeamProject.git

<<<<<<< HEAD


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

=======
>>>>>>> branch 'main' of https://github.com/JsKim5/TeamProject.git
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
	
	UserDAO user_dao;
<<<<<<< HEAD
	public UserController(dao.UserDAO user_dao) {
=======
	
	public UserController(UserDAO user_dao) {
>>>>>>> branch 'main' of https://github.com/JsKim5/TeamProject.git
		this.user_dao = user_dao;
	}
			
	//홈페이지,초기화면
	@RequestMapping(value={"/", "/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}
	
	/*
	 * //사진 넣기
	 * 
	 * @Controller public class FileuploadController {
	 * 
	 * //자동주입(정해진 특정 클래스들을 자동으로 객체생성 해주는 어노테이션)
	 * 
	 * @Autowired HttpServletRequest request;
	 * 
	 * @Autowired ServletContext application;
	 * 
	 * public static final String VIEW_PATH = "/WEB-INF/views/";
	 * 
	 * @RequestMapping(value="/UserInsert_form.do") public String insert_form() {
	 * return VIEW_PATH + "UserInsert_form.jsp"; }
	 * 
	 * @RequestMapping(value={"/UserInsert.do"}) public String UserInsert( UserVO vo
	 * ) {
	 * 
	 * String webPath = "/resources/upload/"; String savePath =
	 * application.getRealPath(webPath);//절대경로
	 * 
	 * System.out.println("절대경로 : " + savePath);
	 * 
	 * String filename = "no_file";
	 * 
	 * //업로드를 위한 파일의 정보 MultipartFile User_image = vo.getUser_image();
	 * 
	 * //업로드 할 파일이 존재한다면... if( !User_image.isEmpty() ) {
	 * 
	 * //실제 업로드 된 파일명 filename = User_image.getOriginalFilename();
	 * 
	 * //저장할 파일의 경로 File saveFile = new File(savePath, filename);
	 * 
	 * if( !saveFile.exists() ) { saveFile.mkdirs(); }else { //같은 이름의 파일이 업로드 되려 하면,
	 * 이름에 //업로드 시간을 붙여서 중복을 방지 long time = System.currentTimeMillis(); filename =
	 * String.format("%d_%s", time, filename); saveFile = new File(savePath,
	 * filename); }
	 * 
	 * 
	 * try { //photo가 가진 파일의 정보를 저장경로에 물리적으로 복사 User_image.transferTo(saveFile);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * }
	 * 
	 * vo.setUser_image_path("resources/user_img/"+filename);
	 * 
	 * request.setAttribute("vo", vo);//바인딩
	 * 
	 * return VIEW_PATH + "input_result.jsp";
	 * 
	 * }//upload
	 * 
	 * }
	 */

	
	
	//회원가입 페이지 이동
	@RequestMapping("/join_form.do")
	public String insert_Form() {
		return VIEW_PATH + "JoinUser.jsp";
	}
	
	@RequestMapping("/join.do")
	//회원가입 처리
<<<<<<< HEAD
	public String joinId( UserVO vo ) {	
		vo.setUser_ip(request.getRemoteAddr() );//ip세팅
		int res = user_dao.insert(vo);		
=======
	public String joinId(UserVO vo) {
		vo.setUser_ip(request.getRemoteAddr() );//ip세팅
		user_dao.insert(vo);
		request.setAttribute("vo", vo);
>>>>>>> branch 'main' of https://github.com/JsKim5/TeamProject.git
		return "redirect:home.do";
	}

	//아이디 찾기 페이지
	@RequestMapping("/searchid.do")
	public String selectId() {
		return VIEW_PATH + "SearchId.jsp";
	}
	
	
	//비밀번호 찾기 페이지
	@RequestMapping("/searchpw.do")
	public String selectPw() {
		return VIEW_PATH + "SearchPw.jsp";
	}
	
	//로그인 페이지
	@RequestMapping("/login_form.do")
	public String login_form() {
		return VIEW_PATH + "Login.jsp";
	}
	
	//로그인
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		UserVO login = user_dao.login(vo);
		
		if(login != null) {
			session.setAttribute("login", login);
		}
		
		return VIEW_PATH + "LoginResult.jsp";
	}
	
	//마이페이지 이동
	@RequestMapping("/mypage_form.do")
	public String mypage_form(UserVO vo) {
		return VIEW_PATH + "MyPage.jsp";
	}
	
	//마이페이지
	@RequestMapping("/mypage.do")
	public String mypage(UserVO vo) {
		UserVO mypage = user_dao.selectMypage(vo);
		return VIEW_PATH + "MyPage.jsp";
	}
	
	//정보수정 페이지
	@RequestMapping("/modify_form.do")
	public String userupdate_form() {
		return VIEW_PATH + "modify.jsp";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:home.do";
	}
	
	//정보수정
	@RequestMapping("/modify.do")
	public String userupdate() {
		
		return "redirect:mypage.do";
	}
}
