package com.mega.teamproject;

import java.util.HashMap;
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
	
	public void Review_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	//모든 리뷰 조회
	@RequestMapping("/review_list.do")	
	public String reviewList() {
		List<ReviewVO> list = review_dao.selectList();
		request.setAttribute("list", list);
		return VIEW_PATH + "review_list.jsp";
	}
}
