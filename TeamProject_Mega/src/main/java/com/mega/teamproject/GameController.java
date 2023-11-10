package com.mega.teamproject;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.GameDAO;
import vo.GameVO;

@Controller
public class GameController {
	@Autowired HttpServletRequest request;
	@Autowired ServletContext application;
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
		
		if(!game_img.isEmpty()) {
			filename = game_img.getOriginalFilename();
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//파일명 중복방지
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
		if(res != 0) {
			result = "yes";
		}
		return VIEW_PATH + "insertResult.jsp?res="+result;
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
		if(res == 0) {
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
            
            // 예제: 게임 제목 가져오기
            Element titleElement = document.select("div.product_title h1").first();
            String gameTitleFromMetacritic = titleElement != null ? titleElement.text() : "N/A";

            // 여기에 다른 정보 추출 코드 추가

            return "Game Title from Metacritic: " + gameTitleFromMetacritic;
        } catch (IOException e) {
            e.printStackTrace();
            return "Error while fetching Metacritic data.";
        }
	}
}
