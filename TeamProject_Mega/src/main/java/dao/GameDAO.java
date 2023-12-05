package dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.GameVO;
import vo.GameVOtwo;
import vo.ReviewVO;

public class GameDAO {
	SqlSession sqlSession;

	public GameDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<GameVO> select(GameVOtwo gvot) {
		List<GameVO> list = sqlSession.selectList("g.selectGame",gvot);
		return list;
	}

	public GameVO selectOne(int idx) {
		GameVO vo = sqlSession.selectOne("g.selectOne", idx);
		return vo;
	}

	public int insert(GameVO vo) {
		int res = sqlSession.insert("g.insertGame", vo);
		return res;
	}

	public int delete(int idx) {
		int res = sqlSession.delete("g.deleteGame", idx);
		return res;
	}

	public String metacritic(String gameTitle) {
		String url = "http://www.metacritic.com/game/" + gameTitle;

		try {
			Document document = Jsoup.connect(url).get();
			String res[] = new String[11];
			String selectTag[] = new String[11];

			selectTag[0] = ".c-productHero_title div"; // 이름
			selectTag[1] = "div.c-gameDetails_Platforms ul li.c-gameDetails_listItem"; // 플렛폼
			selectTag[2] = "a.c-globalButton_container span.c-globalButton_label"; // 장르
			selectTag[3] = null; // 타입
			selectTag[4] = null; // 연령등급
			selectTag[5] = "div.c-gameDetails_Developer ul li.c-gameDetails_listItem"; // 제조사
			selectTag[6] = "div.c-gameDetails_Distributor span.g-outer-spacing-left-medium-fluid"; // 배급사
			selectTag[7] = "div.g-text-xsmall > span.u-text-uppercase"; // 출시일
			selectTag[8] = null; // 이미지
			selectTag[9] = null; // 유튜브
			selectTag[10] = "span[data-v-4cdca868]"; // meta점수

			for (int i = 0; i < selectTag.length; i++) {
				Element element = null;
				Elements elements = null;
				String fromMetacritic = "";

				if (i == 1) {
					elements = document.select(selectTag[i]);
					int j = 0;
					for (Element ele : elements) {
						fromMetacritic += ele.text();
						j++;
						if (j != elements.size()) {
							fromMetacritic += ", ";
						}
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
			HashMap<String, String> resMap = new HashMap<String, String>();
			resMap.put("game_name", res[0]);
			resMap.put("game_platforms", res[1]);
			resMap.put("game_genre", res[2]);
			resMap.put("game_type", res[3]);
			resMap.put("game_rating", res[4]);
			resMap.put("game_developer", res[5]);
			resMap.put("game_publisher", res[6]);
			resMap.put("game_release_date", res[7]);
			resMap.put("game_img", res[8]);
			resMap.put("game_youtube_url", res[9]);
			resMap.put("game_meta_score", res[10]);

			String str = "{";
			int i = 0;
			for (Map.Entry entry : resMap.entrySet()) {
				str += entry.getKey() + " : \"" + entry.getValue() + "\"";
				i++;
				if (i != resMap.size()) {
					str += ",";
				}
			}
			str += "}";
			return "{ metaData : " + str + "}";
		} catch (IOException e) {
			e.printStackTrace();
			return "Error while fetching Metacritic data.";
		}
	}

	public String metacriticGameName() {
		int page = 1;
		String gameName = "";
		while (page < 10) {
			page++;
			String url = "https://www.metacritic.com/browse/game/?platform=ps5&platform=xbox-series-x&platform=nintendo-switch&platform=pc&releaseYearMin=1910&releaseYearMax=2023&page="
					+ page;
			try {
				Document document = Jsoup.connect(url).get();

				String sel = "div.c-finderProductCard a.c-finderProductCard_container";
				Elements elements = document.select(sel);
				String hrefValue = "";

				for (Element aTag : elements) {
					hrefValue = aTag.attr("href");
					String[] parts = hrefValue.split("/");
					gameName += (parts[2] + "/");
				}
			} catch (IOException e) {
				e.printStackTrace();
				return "Error while fetching Metacritic data.";
			}
		}
		return gameName;
	}
	public Map<String, String> metacriticGameImg() {
		int page = 1;
		Map<String, String> gameInfoMap = new HashMap<String, String>();
		while (page < 10) {
			page++;
			String url = "https://www.metacritic.com/browse/game/?platform=ps5&platform=xbox-series-x&platform=nintendo-switch&platform=pc&releaseYearMin=1910&releaseYearMax=2023&page="
					+ page;
			try {
				Document document = Jsoup.connect(url).get();

				Elements aTags = document.select("a.c-finderProductCard_container");
		        for (Element aTag : aTags) {
		        	Element titleElement = aTag.getElementsByClass("c-finderProductCard_title").first();
		            String gameName = titleElement.attr("data-title");
		            String imgUrl = aTag.select("img").first().attr("src");
		            
		            // 게임 이름과 이미지 URL을 Map에 저장
		            gameInfoMap.put(gameName, imgUrl);
		        }
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gameInfoMap;
	}
	
	public void imgUrlOutput() {
		for (Map.Entry<String, String> entry : this.metacriticGameImg().entrySet()) {
            System.out.println("게임 이름: " + entry.getKey());
            System.out.println("이미지 URL: " + entry.getValue());
            System.out.println("-------------------------");
        }
	}
	public String meta10pageInsert() {
		String gameArr[] = this.metacriticGameName().split("/");
		int num = gameArr.length;
		int imgC = 0;
		for(String gameName : gameArr) {
			String url = "http://www.metacritic.com/game/" + gameName;
			try {
				Document document = Jsoup.connect(url).get();
				String res[] = new String[11];
				String selectTag[] = new String[11];

				selectTag[0] = ".c-productHero_title div"; // 이름
				selectTag[1] = "div.c-gameDetails_Platforms ul li.c-gameDetails_listItem"; // 플렛폼
				selectTag[2] = "a.c-globalButton_container span.c-globalButton_label"; // 장르
				selectTag[3] = null; // 타입
				selectTag[4] = null; // 연령등급
				selectTag[5] = "div.c-gameDetails_Developer ul li.c-gameDetails_listItem"; // 제조사
				selectTag[6] = "div.c-gameDetails_Distributor span.g-outer-spacing-left-medium-fluid"; // 배급사
				selectTag[7] = "div.g-text-xsmall > span.u-text-uppercase"; // 출시일
				selectTag[8] = null; // 이미지
				selectTag[9] = null; // 유튜브
				selectTag[10] = "span[data-v-4cdca868]"; // meta점수
				
				for (int i = 0; i < selectTag.length; i++) {
					Element element = null;
					Elements elements = null;
					String fromMetacritic = "";

					if (i == 1) {
						elements = document.select(selectTag[i]);
						int j = 0;
						for (Element ele : elements) {
							fromMetacritic += ele.text();
							j++;
							if (j != elements.size()) {
								fromMetacritic += ", ";
							}
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
				}
				
				for (Map.Entry<String, String> entry : this.metacriticGameImg().entrySet()) {
					
		            if(entry.getKey().equals(res[0])) {
		            	System.out.println("--------------");
		            	System.out.println("entry.getKey() : " + entry.getKey());
		            	System.out.println("res[0] : " + res[0] );
		            	res[8] = entry.getValue();
		            	imgC++;
		            	
		            }
		        }
				GameVO vo = new GameVO();
				vo.setGame_name(res[0]);
				vo.setGame_platforms(res[1]);
				vo.setGame_genre(res[2]);
				vo.setGame_type(res[3]);
				vo.setGame_rating(res[4]);
				vo.setGame_developer(res[5]);
				vo.setGame_publisher(res[6]);
				vo.setGame_release_date(res[7]);
				vo.setGame_image_path(res[8]);
				vo.setGame_youtube_url(res[9]);
				vo.setGame_meta_score(Integer.parseInt(res[10]));
				this.insert(vo);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(imgC + " 개 이미지 url 등록 완료");
		return "yes";
	}
	
	public int getRowTotal(GameVOtwo gvot) {
		int res = sqlSession.selectOne("g.game_count",gvot);
		return res;
	}
	
	public List<String> platformsSearch() {
		List<String> list = sqlSession.selectList("g.platformsSearch");
		Set<String> resultSet = new LinkedHashSet<String>();
		
		for(String res : list) {
			String temp[] = res.split(",");
			if(temp.length != 0) {
				for(String tempres : temp) {
					resultSet.add(tempres.trim());
				}
			} else {
				resultSet.add(res.trim());
			}
		}
		
		List<String> resList = new ArrayList<String>(resultSet);
		Collections.sort(resList); // 알파벳 순서로 정렬
		return resList;
	}
	
	public List<Integer> getIndexNumber(List<String> list) {
		List<Integer> indexNumber = new ArrayList<Integer>();
		String temp = "";
		for (String res : list) {
        	if(!temp.equals(String.valueOf(res.charAt(0)))) {
        	temp = String.valueOf(res.charAt(0));
        	indexNumber.add(list.indexOf(res));
        	}
        }
		return indexNumber;
	}
	
	public List<String> colSearch(String select_col) {
		List<String> list = sqlSession.selectList("g.colSearch",select_col);
		Collections.sort(list); // 알파벳 순서로 정렬
		return list;
	}
	
	public List<ReviewVO> review_selectList(String game_name){
		List<ReviewVO> list = sqlSession.selectList("r.review_list", game_name);
		return list;
	}
	
	public int review_count(String game_name) {
		int res = sqlSession.selectOne("r.review_count", game_name);
		return res;
	}
	
	public int youtubeUrlUpdate(GameVO vo) {
		int res = sqlSession.update("g.youtubeUrlUpdate",vo);
		return res;
	}
	
	public int insertYoutubeUrl(GameVO vo) {
		int res = sqlSession.insert("g.insertYoutubeUrl",vo);
		return res;
	}
<<<<<<< HEAD
=======
	
	public int mainPageInsert(GameVO vo) {
		int res = sqlSession.insert("g.mainPageInsert", vo);
		return res;
	}
	
	public List<GameVO> selectMain() {
		List<GameVO> list = sqlSession.selectList("g.selectMain");
		return list;
	}
>>>>>>> branch 'main' of https://github.com/JsKim5/TeamProject.git
}
