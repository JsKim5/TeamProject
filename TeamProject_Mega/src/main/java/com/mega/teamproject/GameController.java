package com.mega.teamproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.GameDAO;
import vo.GameVO;

@Controller
public class GameController {
	@Autowired HttpServletRequest request;
	GameDAO gameDao;
	public static final String VIEW_PATH = "/WEB-INF/views/game/";
	
	public GameController(GameDAO gameDao) {
		this.gameDao = gameDao;
	}
	
	@RequestMapping("/gameList.do")
	public String gameList() {
		List<GameVO> list = gameDao.select();
		request.setAttribute("list", list);
		return VIEW_PATH + "gameList.jsp";
	}
	
	@RequestMapping("/gameInsert.do")
	public String gameInsert(GameVO vo) {
		int res = gameDao.insert(vo);
		String result = "no";
		if(res != 0) {
			result = "yes";
		}
		return VIEW_PATH + "gameList.jsp?res="+result;
	}
}
