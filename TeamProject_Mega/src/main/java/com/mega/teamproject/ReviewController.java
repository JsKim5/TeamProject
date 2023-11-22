package com.mega.teamproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReviewDAO;
import vo.ReviewVO;

@Controller
public class ReviewController {
	@Autowired HttpServletRequest request;
	public static final String VIEW_PATH = "/WEB-INF/views/review/";
	
	ReviewDAO review_dao;
	
	public ReviewController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	//게임별 리뷰 조회
	@RequestMapping("/review_list.do")	
	public String reviewList(String game_name) {
		List<ReviewVO> list = review_dao.selectList(game_name);
		request.setAttribute("review_list", list);
		return VIEW_PATH + "review_list.jsp";
	}
	
	//모든 리뷰 조회
	@RequestMapping("/review_AL.do")
	public String reviewAL() {
		List<ReviewVO> list = review_dao.selectList_AL();
		request.setAttribute("list", list);
		return VIEW_PATH + "review_AL.jsp";
	}
	
	@RequestMapping("/review_write.do")
	public String insertForm() {
		if(request.getSession().getAttribute("login") != null) {
		return VIEW_PATH + "review_write.jsp";
		}
		else {
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("/review_insert.do")
	public String insert(ReviewVO vo) {	
		review_dao.insert(vo);
		return "redirect:gameView.do?idx="+vo.getGame_idx();
	}
	
	@RequestMapping("/review_view.do")
	public String reviewView(int idx) {
		ReviewVO vo = review_dao.selectOne(idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH + "review_view.jsp";
	}
	
	@RequestMapping("/review_ALview.do")
	public String reviewALView(int idx) {
		ReviewVO vo = review_dao.selectOne(idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH + "review_ALview.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/deleteReview.do")
	public String reviewDelete(int idx) {
		int res = review_dao.delete(idx);
		String result = "del";
		if (res == 0) {
			result = "no";
		}
		return result;
	}
	
}
