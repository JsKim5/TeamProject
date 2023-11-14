package com.mega.teamproject;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.GameDAO;
import vo.GameVO;

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
	public String gameList() {
		List<GameVO> list = gameDao.select();
		request.setAttribute("list", list);
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
		String result = "yes";
		if (res == 0) {
			result = "no";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/metacritic.do")
	public String meta(String gameTitle) {
		String url = "http://www.metacritic.com/game/" + gameTitle;

		try {
			Document document = Jsoup.connect(url).get();
			String res[] = new String[11];
			String selectTag[] = new String[11];
			selectTag[0] = ".c-productHero_title div"; // 이름
			selectTag[1] = "ul.g-outer-spacing-left-medium-fluid li.c-gameDetails_listItem"; // 플렛폼
			selectTag[2] = null; // 장르
			selectTag[3] = null; // 타입
			selectTag[4] = null; // 연령등급
			selectTag[5] = null; // 제조사
			selectTag[6] = null; // 배급사
			selectTag[7] = "div.g-text-xsmall > span.u-text-uppercase"; // 출시일
			selectTag[8] = null; // 이미지
			selectTag[9] = null; // 유튜브
			selectTag[10] = "span[data-v-4cdca868]"; // meta점수

			for (int i = 0; i < selectTag.length; i++) {
				Element element = null;
				Elements elements = null;
				String fromMetacritic = null;

				if (i == 1) {
					elements = document.select(selectTag[i]);
					for (Element ele : elements) {
						fromMetacritic += ele.text() + ",";
					}

				} else {
					if (selectTag[i] != null) {
						element = document.select(selectTag[i]).first();
					}

					if (element == null) {
						fromMetacritic = "N/A";
					} else {
						fromMetacritic = element.text();
					}
				}
				res[i] = fromMetacritic;
				System.out.println(res[i]);
			}
			return Arrays.toString(res);
		} catch (IOException e) {
			e.printStackTrace();
			return "Error while fetching Metacritic data.";
		}
	}
}
