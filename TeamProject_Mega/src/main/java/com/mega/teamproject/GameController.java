package com.mega.teamproject;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.GameDAO;
import util.Common;
import util.Paging;
import vo.GameVO;
import vo.GameVOtwo;
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
	public String gameList(String page, String selectCol, String search, String searchTitle) {

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

		
		GameVOtwo gvot = new GameVOtwo();
		gvot.setStart(start);
		gvot.setEnd(end);
		boolean aOption = search != null && !search.isEmpty();
		boolean bOption = selectCol != null && !selectCol.isEmpty();
		boolean cOption = searchTitle != null && !searchTitle.isEmpty();
		if (aOption && bOption) {
			gvot.setSelectCol(selectCol);
			gvot.setSearch(search);
		}
		if (cOption) {
			gvot.setTitle(searchTitle);
		}
		
		List<GameVO> list = gameDao.select(gvot);
		// 전체 게시글 수
		int row_total = gameDao.getRowTotal(gvot);

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
		List<ReviewVO> list = gameDao.review_selectList(vo.getGame_name());
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
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
		if (select.equals("game_platforms")) {
			list = gameDao.platformsSearch();
		} else {
			list = gameDao.colSearch(select);
		}

		request.getSession().setAttribute("selectList", list);
		request.getSession().setAttribute("selectOption", select + " (" + list.size() + ")");
		request.getSession().setAttribute("selectCol", select);
		return "yes";
	}
	
	@RequestMapping("/gameTitleSearch.do")
	public String gameTitleSearch(String title) {
		request.getSession().removeAttribute("selectList");
		request.getSession().removeAttribute("selectOption");
		request.getSession().removeAttribute("selectCol");
		
		if(title != null && !title.isEmpty()) {
			return "redirect:gameList.do?searchTitle="+title;
		} else {
			return "redirect:gameList.do";
		}
	}
}
