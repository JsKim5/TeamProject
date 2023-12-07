package com.mega.teamproject;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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
import vo.UserVO;

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

		String url = "gameList.do";
		GameVOtwo gvot = new GameVOtwo();
		gvot.setStart(start);
		gvot.setEnd(end);
		boolean aOption = search != null && !search.isEmpty();
		boolean bOption = selectCol != null && !selectCol.isEmpty();
		boolean cOption = searchTitle != null && !searchTitle.isEmpty();
		if (aOption && bOption) {
			gvot.setSelectCol(selectCol);
			gvot.setSearch(search);
			url = "gameList.do?selectCol="+selectCol+"&search="+search;
		}
		if (cOption) {
			gvot.setTitle(searchTitle);
			url = "gameList.do?searchTitle="+searchTitle;
		}
		
		List<GameVO> list = gameDao.select(gvot);
		// 전체 게시글 수
		int row_total = gameDao.getRowTotal(gvot);

		// 페이지 메뉴 만들기
		String pageMenu = Paging.getPaging(url, nowPage, row_total, Common.GameList.BLOCKLIST,
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
		int count = gameDao.review_count(vo.getGame_name());
		request.setAttribute("count", count);
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
		
		List<Integer> indexNumber = gameDao.getIndexNumber(list);
		request.getSession().setAttribute("indexNumber", indexNumber);
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
	
	@RequestMapping("/youtubeUrlUpdate.do")
	public String youtubeUrlUpdate(GameVO vo,int page) {
		int res = gameDao.youtubeUrlUpdate(vo);
		int res2 = gameDao.insertYoutubeUrl(vo);
		return "redirect:gameAdminPage.do?page="+page;
	}
	
	@RequestMapping("/gameAdminPage.do")
	public String gameAdminPage(String page, String searchTitle) {
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
				boolean cOption = searchTitle != null && !searchTitle.isEmpty();
				if (cOption) {
					gvot.setTitle(searchTitle);
				}
				gvot.setStart(start);
				gvot.setEnd(end);
				
				List<GameVO> list = gameDao.select(gvot);
				List<GameVO> mainList = gameDao.selectMain();
				// 전체 게시글 수
				int row_total = gameDao.getRowTotal(gvot);

				// 페이지 메뉴 만들기
				String pageMenu = Paging.getPaging("gameAdminPage.do", nowPage, row_total, Common.GameList.BLOCKLIST,
						Common.GameList.BLOCKPAGE);
				
				request.setAttribute("mainList", mainList);
				request.setAttribute("total", row_total);
				request.setAttribute("list", list);
				request.setAttribute("pageMenu", pageMenu);
		return VIEW_PATH + "gameAdminPage.jsp";
	}
	
	@RequestMapping("/testPage.do")
	public String testPage() {
		List<GameVO> mainList = gameDao.selectMain();
		request.setAttribute("mainList", mainList);
		return "/WEB-INF/views/MainPage2.jsp";
	}
	
	@RequestMapping("/mainGameInsert.do")
	public String mainGameInsert(GameVO vo) {
		
		int res = gameDao.mainPageInsert(vo);
		
		return "redirect:gameAdminPage.do";
	}
	
	@RequestMapping("/youtubeAll.do")
	public String youtubeAll() {
		gameDao.updateYoutubeAll();
		return "redirect:gameAdminPage.do";
	}
	
	@RequestMapping("/signUpMacro.do")
	public String signUpMacro() {
		String[] userID = {
	            "SparkleDancer87", "MidnightPhoenix23", "TurboGizmo56", "ElectricLioness19", "QuantumNinja42",
	            "CosmicJester75", "MysticVoyager31", "ThunderByte14", "NeonSpecter68", "FrostyPanda26",
	            "ShadowFlame91", "CrystalEcho55", "BlazeRunner79", "TechSavvyFox63", "AquaStarlight37",
	            "EmberWanderer82", "DigitalSphinx48", "HarmonyWhisper74", "SwiftShadowcat29", "AuroraGlimmer17",
	            "CyberStormDancer52", "VelvetThunderbolt88", "SolarSerenade10", "PixelEnigma44", "LunarZephyr67",
	            "QuantumQuasar21", "MysticSoul67", "NeoSpiritWolf38", "ElementalPulse95", "CelestialCipher11",
	            "SolarFlareDancer71", "TechnoNova84", "ShadowFrostDragon49", "EnigmaticSpecter76", "CyberneticCheetah27",
	            "ElectricSphinx62", "GalaxySongbird18", "EmberWhisperer33", "SwiftBlazeRider57", "CrystalCyborg89",
	            "MidnightSerenity25", "NovaDreamer47", "ThunderProwler72", "QuantumGadgeteer90", "MysticFusion14",
	            "ElementalEcho58", "CosmicCipher81", "BlazeShifter26", "CyberPhoenix69", "NeonNebulae32",
	            "TechSavantTiger63", "AquaAurora87", "EmberEclipse19", "ShadowSpectra45", "DigitalDreamer71",
	            "QuantumQuasar88", "MysticWhisperer24", "SolarSoul13", "PixelPulse57", "LunarLioness96",
	            "CosmicCybercat21", "QuantumQuake77", "ElementalEcho36", "CelestialSphinx42", "SolarShadow89",
	            "TechnoThunderbird10", "ShadowStormDancer58", "EnigmaFlare94", "CyberneticSerenade27", "ElectricEclipse73",
	            "GalaxyGadgeteer35", "EmberEcho81", "SwiftSpecter46", "CrystalCheetah62", "MidnightMystic18",
	            "NovaNebulae29", "ThunderTechWiz55", "QuantumQuasar82", "MysticMirage17", "NeoNinja49",
	            "ElementalEssence74", "CosmicCipher38", "BlazeBolt97", "CyberPhoenix21", "NeonNova44",
	            "TechTigerLily68", "AquaAbyssal12", "EmberEclipse59", "ShadowSphinx83", "DigitalDreamer28",
	            "QuantumQuake64", "MysticMaverick39", "SolarSpectra75", "PixelProwler20", "LunarLuminance51",
	            "CosmicCatalyst86", "QuantumQuasar11", "ElementalEclipse77", "CelestialSerenity23", "SolarShadowcat48"
	        };
		String[] nicknames = {
	            "ShadowRider", "Firestorm", "FrostyNinja", "TechSavvy", "MidnightSoul",
	            "NeonBlaze", "CrystalWarrior", "SonicWraith", "AquaSerenity", "ThunderPulse",
	            "EclipseWhisper", "LuminousFlare", "MysticStorm", "DigitalPhantom", "BlazingSpirit",
	            "CyberDragon", "CelestialNova", "PhantomGlider", "NeonSpecter", "TechEnigma",
	            "FrostByte", "ShadowChaser", "AbyssalPhoenix", "SolarCipher", "ThunderBolt",
	            "LunarWhisperer", "StormRider", "CosmicWanderer", "BlazeRunner", "NeoNebula",
	            "TechVoyager", "SpiritualSphinx", "MysticGlider", "EternalFlame", "QuantumEcho",
	            "LunarSpectra", "ShadowBlade", "DigitalProwler", "AuroraWhisper", "CelestialSavior",
	            "NeonStorm", "TechPhantom", "BlazeWraith", "FrostSoul", "MysticEclipse",
	            "CyberShifter", "SolarSpecter", "ShadowHunter", "QuantumBlaze", "AbyssalSphinx",
	            "EternalNova", "CrystalEnigma", "NeonPulse", "LuminousWhisper", "TechWanderer",
	            "ShadowRunner", "CosmicPhoenix", "BlazeVoyager", "EclipseSpectra", "MysticChaser",
	            "NeonWraith", "DigitalSavior", "StormCipher", "AuroraEnigma", "QuantumBlade",
	            "SolarPhantom", "CyberStorm", "LunarSoul", "CelestialPulse", "NeonEclipse",
	            "TechNova", "BlazeWhisperer", "FrostShadow", "MysticBlade", "ShadowVoyager",
	            "CosmicWraith", "EclipseSavior", "QuantumEnigma", "SolarChaser", "AbyssalStorm",
	            "NeoNebulae", "TechSpecter", "LunarPhoenix", "CelestialBlaze", "NeonCipher",
	            "MysticRunner", "ShadowWhisper", "CosmicPulse", "BlazeGlider", "DigitalEclipse",
	            "FrostSpectra", "EternalCipher", "QuantumWanderer", "SolarBlade", "AbyssalEclipse",
	            "NeoNinja", "TechRider", "LunarEnigma", "CelestialChaser", "NeonPhoenix"
	        };
		String[] names = {
	            "김지우", "이서연", "박지훈", "최유진", "정준우",
	            "강서연", "조동현", "윤서아", "장민재", "한가온",
	            "송하은", "배준호", "황서윤", "문예준", "류서진",
	            "고민우", "신수아", "강민준", "유하린", "임예준",
	            "나지우", "백준영", "오수민", "진하준", "한가윤",
	            "서도현", "신지민", "황동현", "최소은", "이건우",
	            "김다은", "박태윤", "장민서", "조시우", "류은우",
	            "강건우", "윤시우", "신시현", "고윤우", "문지윤",
	            "류시윤", "백윤서", "오서은", "진도현", "한가람",
	            "송시윤", "배건우", "황수아", "최은서", "정준서",
	            "강다은", "조주원", "윤현우", "장지윤", "한지아",
	            "서윤우", "신수빈", "황태민", "최다은", "이주원",
	            "김지우", "박서은", "류도현", "최가윤", "정윤서",
	            "강하윤", "조도현", "윤수빈", "장가은", "한태민",
	            "송하은", "배건우", "황수민", "최은찬", "이준우",
	            "김다은", "이주원", "박서아", "최하윤", "정현우",
	            "강지윤", "조도현", "윤가윤", "장수민", "한지안",
	            "서도윤", "신수빈", "황태민", "최다온", "이서우"
	        };
		int num = 0;
		
		String email2 = "example.com";
		for(String id : userID) {
			String email = "user" + num;
			
			UserVO vo = new UserVO();
			vo.setUser_email(email);
			vo.setUser_email2(email2);
			vo.setUser_pwd("1111");
			
			vo.setUser_id(userID[num]);
			vo.setUser_name(names[num]);
			vo.setUser_nickname(nicknames[num]);
			
			num++;
			vo.setUser_ip(request.getRemoteAddr());// ip세팅
			gameDao.insert(vo);
			
			if(num == 80) {
				break;
			}
		}
		return VIEW_PATH + "insertResult.jsp?res=end"; 
	}
	
	@RequestMapping("/reviewMacro.do")
	public String reviewMacro() {
        Random random = new Random();
        String[] reviews = {
                "재밌게 했습니다.", "정말 좋은 게임이에요", "제 스타일의 게임은 아닙니다.", "너무 어려워요",
                "한 번 더 하고 싶네요.", "몰입감이 좋아요.", "이 게임을 추천합니다.", "그래픽이 멋져요.",
                "스토리가 흥미롭네요.", "다양한 캐릭터들이 있어서 좋아요.", "음악이 좋습니다.", "간단하지만 재미있어요.",
                "업데이트가 기대됩니다.", "이 게임은 명작입니다.", "시간 가는 줄 몰랐어요.", "내가 이겼다!",
                "좀 더 다양한 스테이지가 있었으면 좋겠어요.", "리플레이 가치가 있습니다.", "퍼즐이 어렵네요.", "상당히 만족스럽습니다.",
                "이 게임은 새로운 경험이에요.", "기대 이상입니다.", "내가 찾던 게임이에요.", "끝내주는 그래픽!",
                "자꾸만 빠져들게 만드는 게임이에요.", "아쉽게도 너무 짧은 게임이었어요.", "재미있는 플레이 방식입니다.", "이런 게임을 기다렸어요.",
                "조작이 복잡해요.", "좀 더 다양한 무기가 있었으면 좋겠어요.", "이야기가 감동적이에요.", "쉽게 배울 수 있어서 좋아요.",
                "그래픽이 조금 아쉬워요.", "좋은 시간을 보냈습니다.", "장점이 많은 게임이에요.", "도전적인 게임이네요.",
                "재미있는 게임이었습니다.", "퀄리티가 뛰어납니다.", "이 게임은 내 스타일이에요.", "다시는 하고 싶지 않아요.",
                "아쉽게도 너무 짧은 스토리에요.", "몇 가지 아쉬운 점이 있지만 재밌었습니다.", "음향 효과가 좋아요.", "더 많은 콘텐츠를 원합니다.",
                "저에겐 좀 지루한 게임이었어요.", "상상 이상이었습니다.", "이런 게임이 더 많이 나왔으면 좋겠어요.", "전혀 내 취향이 아닌 게임이었어요.",
                "시간 낭비였어요.", "모바일에서도 잘 돌아가네요.", "엔딩이 기대되는 게임이었어요.", "무과금으로도 즐길 수 있는 게임입니다.",
                "그냥 평범한 게임이네요.", "더 많은 기능이 있었으면 좋겠어요.", "솔직히 별로였어요.", "나름 괜찮은 게임입니다.",
                "이런 게임을 찾고 있었어요.", "조작이 간편해서 좋아요.", "끝나지 않는 재미입니다.", "아쉽게도 서비스가 종료되었어요.",
                "많은 사람들이 즐기면 좋을 게임이에요.", "콘텐츠 업데이트가 빨라서 좋아요.", "전략적인 요소가 많은 게임입니다.", "재미있는 도전이에요.",
                "이 게임을 추천하지 않습니다.", "이런 게임을 기다렸어요.", "플레이하는 동안 몰입감이 좋았어요.", "단순하지만 중독성이 있어요.",
                "충분히 재미있는 게임입니다.", "높은 난이도라서 도전적이에요.", "그래픽이나 사운드가 아쉬워요.", "더 많은 다양성이 있었으면 좋겠어요.",
                "흥미로운 스토리텔링입니다.", "이런 게임은 처음이네요.", "더 많은 곳을 탐험하고 싶었어요.", "무과금으로는 어렵네요.",
                "많은 시간을 보낼 수 있는 게임입니다.", "기대 이상이었습니다.", "내가 한 게임 중 최고예요!", "사운드 퀄리티가 아쉬워요."
            };
        String[] nicknames = {
	            "ShadowRider", "Firestorm", "FrostyNinja", "TechSavvy", "MidnightSoul",
	            "NeonBlaze", "CrystalWarrior", "SonicWraith", "AquaSerenity", "ThunderPulse",
	            "EclipseWhisper", "LuminousFlare", "MysticStorm", "DigitalPhantom", "BlazingSpirit",
	            "CyberDragon", "CelestialNova", "PhantomGlider", "NeonSpecter", "TechEnigma",
	            "FrostByte", "ShadowChaser", "AbyssalPhoenix", "SolarCipher", "ThunderBolt",
	            "LunarWhisperer", "StormRider", "CosmicWanderer", "BlazeRunner", "NeoNebula",
	            "TechVoyager", "SpiritualSphinx", "MysticGlider", "EternalFlame", "QuantumEcho",
	            "LunarSpectra", "ShadowBlade", "DigitalProwler", "AuroraWhisper", "CelestialSavior",
	            "NeonStorm", "TechPhantom", "BlazeWraith", "FrostSoul", "MysticEclipse",
	            "CyberShifter", "SolarSpecter", "ShadowHunter", "QuantumBlaze", "AbyssalSphinx",
	            "EternalNova", "CrystalEnigma", "NeonPulse", "LuminousWhisper", "TechWanderer",
	            "ShadowRunner", "CosmicPhoenix", "BlazeVoyager", "EclipseSpectra", "MysticChaser",
	            "NeonWraith", "DigitalSavior", "StormCipher", "AuroraEnigma", "QuantumBlade",
	            "SolarPhantom", "CyberStorm", "LunarSoul", "CelestialPulse", "NeonEclipse",
	            "TechNova", "BlazeWhisperer", "FrostShadow", "MysticBlade", "ShadowVoyager",
	            "CosmicWraith", "EclipseSavior", "QuantumEnigma", "SolarChaser", "AbyssalStorm",
	            "NeoNebulae", "TechSpecter", "LunarPhoenix", "CelestialBlaze", "NeonCipher",
	            "MysticRunner", "ShadowWhisper", "CosmicPulse", "BlazeGlider", "DigitalEclipse",
	            "FrostSpectra", "EternalCipher", "QuantumWanderer", "SolarBlade", "AbyssalEclipse",
	            "NeoNinja", "TechRider", "LunarEnigma", "CelestialChaser", "NeonPhoenix"
	        };
        // 478부터 703까지의 랜덤 정수 생성
        
        int min = 478;
        int max = 703;
        int lastIndex = reviews.length - 1;
        int nicknamelastIndex = reviews.length - 1;
        for(int i = 0; i < 1000; i++) {
        	
        	int randomNumber = random.nextInt(max - min + 1) + min;
        	int randomIndex = random.nextInt(lastIndex + 1);
        	int randomnicknameIndex = random.nextInt(nicknamelastIndex + 1);
        	int randomScore = (int)(Math.random() * 5) + 1;
        	ReviewVO vo = new ReviewVO();
        	vo.setGame_idx(randomNumber);
        	vo.setUser_review(reviews[randomIndex]);
        	vo.setUser_nickname(nicknames[randomnicknameIndex]);
        	vo.setReview_title(reviews[randomIndex]);
        	vo.setUser_score(randomScore);
        	
        	String gameName = gameDao.selectGameName(randomNumber);
        	if(gameName != null) {
        		System.out.println(gameName);
            	vo.setGame_name(gameName);
            	gameDao.insert(vo);
        	}

        	
        }
        
        return VIEW_PATH + "insertResult.jsp?res=end"; 
	}
}
