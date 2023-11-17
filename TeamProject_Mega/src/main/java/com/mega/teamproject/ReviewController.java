package com.mega.teamproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	//모든 리뷰 조회
	@RequestMapping("/review_list.do")	
	public String reviewList() {
		List<ReviewVO> list = review_dao.selectList();
		request.setAttribute("list", list);
		return VIEW_PATH + "review_list.jsp";
	}
	
	@RequestMapping("/review_write.do")
	public String insertForm() {
		return VIEW_PATH + "review_write.jsp";
	}
	
	@RequestMapping("/review_insert.do")
	public String insert(ReviewVO vo) {
		review_dao.insert(vo);
		System.out.println(vo.getReview_title() + vo.getUser_review() + vo.getUser_score());
		return "redirect:review_list.do";
	}
	
	@RequestMapping("/review_view.do")
	public String reviewView(int idx) {
		ReviewVO vo = review_dao.selectOne(idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH + "review_view.jsp";
	}
}
