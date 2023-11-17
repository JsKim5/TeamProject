package com.mega.teamproject;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.GameDAO;
import dao.ReviewDAO;
import util.Common;
import util.Paging;
import vo.GameVO;
import vo.ReviewVO;

@Controller
public class GameController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext application;
	GameDAO gameDao;
	public static final String VIEW_PATH = "/WEB-INF/views/game/";

	public GameController(GameDAO gameDao) {
		this.gameDao = gameDao;
	}

	@RequestMapping("/gameList.do")
	public String gameList(String page) {

		// list.do?page=1
		// list.do?page= >> 값이 없으면 empty
		// list.do? >> page가 없으면 null
		int nowPage = 1; // 기본 페이지
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}

		// 한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
		// 1페이지에는 1 ~ 3까지 보여야 되고
		// 2페이지에는 4 ~ 6까지 보여줘야 하므로 특정 공식이 필요하다
		int start = (nowPage - 1) * Common.GameList.BLOCKLIST + 1;
		int end = start + Common.GameList.BLOCKLIST - 1;

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		List<GameVO> list = gameDao.select(map);

		// 전체 게시글 수
		int row_total = gameDao.getRowTotal();
		// 페이지 메뉴 만들기
		String pageMenu = Paging.getPaging("gameList.do", nowPage, row_total, Common.GameList.BLOCKLIST,
				Common.GameList.BLOCKPAGE);

		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);

		return VIEW_PATH + "gameList.jsp";
	}

	@RequestMapping("/gameInsertForm.do")
	public String gameInsertForm() {
		return VIEW_PATH + "gameInsert.jsp";
	}

	@RequestMapping("/gameInsert.do")
	public String gameInsert(GameVO vo) {
		String webPath = "/resources/game_img/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대 경로 : " + savePath);
		String filename = "no_file";

		MultipartFile game_img = vo.getGame_img();

		if (!game_img.isEmpty()) {
			filename = game_img.getOriginalFilename();
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 파일명 중복방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				game_img.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		vo.setGame_image_path("resources/game_img/" + filename);

		int res = gameDao.insert(vo);
		String result = "no";
		if (res != 0) {
			result = "yes";
		}
		return VIEW_PATH + "insertResult.jsp?res=" + result;
	}

	@RequestMapping("/gameView.do")
	public String gameView(int idx) {
		GameVO vo = gameDao.selectOne(idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH + "gameView.jsp";
	}

	@ResponseBody
	@RequestMapping("/gameDelete.do")
	public String gameDelete(int idx) {
		int res = gameDao.delete(idx);
		String result = "del";
		if (res == 0) {
			result = "no";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/metacritic.do")
	public String metacritic(String gameTitle) {
		String str = gameDao.metacritic(gameTitle);
		return str;
	}

	@ResponseBody
	@RequestMapping("/metacritic10page.do")
	public String metacritic10page() {
		gameDao.meta10pageInsert();
		return "yes";
	}
	
	@ResponseBody
	@RequestMapping("/gameSelectSearch.do")
	public String gameSelectSearch(String select) {
		List<String> list = null;
		if(select.equals("game_platforms"))list = gameDao.platformsSearch();
		if(select.equals("game_genre"))list = gameDao.genreSearch();
		if(select.equals("game_developer"))list = gameDao.developerSearch();
		if(select.equals("game_publisher"))list = gameDao.publisherSearch();
		
		
		
		System.out.println(list.size());
		for(String temp : list) {
			System.out.println(temp);
		}
		request.setAttribute("selectList",list);
		return "searchSelect";
	}
}
