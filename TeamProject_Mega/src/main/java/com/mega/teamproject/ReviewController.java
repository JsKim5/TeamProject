package com.mega.teamproject;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReviewDAO;
import util.Common;
import util.Paging;
import vo.ReviewVO;

@Controller
public class ReviewController {
	@Autowired HttpServletRequest request;
	public static final String VIEW_PATH = "/WEB-INF/views/review/";
	
	ReviewDAO review_dao;
	
	public ReviewController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	@RequestMapping("/review_AL.do")
	public String list(String page) {
		
		//list.do?page=1
		//list.do?page=     >> 값이 없으면 empty
		//list.do?			>> page가 없으면 null
		int nowPage = 1; // 기본 페이지
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
		//1페이지에는 1 ~ 3까지 보여야 되고
		//2페이지에는 4 ~ 6까지 보여줘야 하므로 특정 공식이 필요하다
		int start = (nowPage - 1) * Common.Review_AL.BLOCKLIST + 1;
		int end = start + Common.Review_AL.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<ReviewVO> list = review_dao.selectList_AL(map); 
		int count = review_dao.review_countAL();
		//전체 게시글 수
		int row_total = count;
		//페이지 메뉴 만들기
		String pageMenu = Paging.getPaging("review_AL.do", nowPage, row_total, Common.Review_AL.BLOCKLIST , Common.Review_AL.BLOCKPAGE);
				
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		return VIEW_PATH + "review_AL.jsp";
	}
	
	//게임별 리뷰 조회
	@RequestMapping("/review_list.do")	
	public String reviewList(String game_name) {
		List<ReviewVO> list = review_dao.selectList(game_name);
		request.setAttribute("review_list", list);
		return VIEW_PATH + "review_list.jsp";
	}
	
	@RequestMapping("/review_write.do")
	public String insertForm() {
		if(request.getSession().getAttribute("login") != null) {
		return VIEW_PATH + "review_write.jsp";
		}
		else {
			return "redirect:login_form.do";
		}
	}
	
	@RequestMapping("/review_insert.do")
	public String insert(ReviewVO vo) {	
		review_dao.insert(vo);
		int avg = review_dao.scoreAVG_update(vo.getGame_name());
		request.setAttribute("avg", avg);
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
	@RequestMapping("/deleteReviewAD.do")
	public String reviewDeleteAD(int idx, String game_name) {
		int res = review_dao.deleteAD(idx);
		int avg = review_dao.scoreAVG_update(game_name);
		request.setAttribute("avg", avg);
		String result = "del";
		if (res == 0) {
			result = "no";
		}
		return result;
	}
	
	@RequestMapping("/MainPage.do")
	public String MainPage() {
		return "/WEB-INF/views/MainPage.jsp";
	}
	
}
