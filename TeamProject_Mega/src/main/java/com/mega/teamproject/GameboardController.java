package com.mega.teamproject;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.GameboardDAO;
import util.Common;
import util.Paging;
import vo.GameBoardPagingVO;
import vo.GameboardVO;

@Controller
public class GameboardController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/gameboard/";
	
	GameboardDAO gameboard_dao;
	public void setGameboard_dao(GameboardDAO gameboard_dao) {
		this.gameboard_dao = gameboard_dao;
	}
	
	//게시판의 모든 글 조회
	@RequestMapping(value={"/list.do"})
	public String list(Model model,String page,String game_name) {
		
		String url = "list.do";
		int nowPage=1; //기본페이지
		if(page != null && !page.isEmpty() ) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage -1)*Common.Gameboard.BLOCKLIST+1;
		int end = start + Common.Gameboard.BLOCKLIST -1;
		
		GameBoardPagingVO pvo = new GameBoardPagingVO(); 
		pvo.setStart(start);
		pvo.setEnd(end);
		if(game_name != null && !game_name.isEmpty() ) {
			pvo.setGame_name(game_name);
			url += "?game_name="+game_name;
		}
		
		List<GameboardVO> list = gameboard_dao.selectList(pvo);
		
		request.getSession().removeAttribute("show");
		
	//전체 게시글 수
		int row_total = gameboard_dao.getRowTotal(game_name);
	//페이지 메뉴 만들기
		String pageMenu = Paging.getPaging(url, nowPage, row_total, Common.Gameboard.BLOCKLIST , Common.Gameboard.BLOCKPAGE);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		return VIEW_PATH + "gameboard_list.jsp";
	}
	
	
	//게시판 글쓰기화면
		@RequestMapping("/gameboard_write_form.do")
		public String write_form() {
			
			return VIEW_PATH + "gameboard_write.jsp";
		}
		
	//글쓰기 데이터 
	@RequestMapping("/gameboard_write.do")
	public String write(GameboardVO vo) {
		
		
		//파일첨부와 관련된 코드
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);//절대경로
				
		String filename_image = "no_file";
				
		//업로드를 위한 파일의 정보
		MultipartFile photo = vo.getPhoto();
		System.out.println("a:"+photo.getOriginalFilename());
		
		//업로드할 파일이 존재한다면..
		if(!photo.isEmpty()) {
			//실제 업로드 된 파일명
			filename_image = photo.getOriginalFilename();
			//저장할 파일의 경로
			File saveFile = new File(savePath,filename_image);
					
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				//파일명 중복 처리
				long time =System.currentTimeMillis();
				filename_image = String.format("%d_%s",time,filename_image);
				saveFile = new File(savePath,filename_image);
			}
		
			try {
				photo.transferTo(saveFile);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
					
	}
		vo.setFilename_image(filename_image);
		int res = gameboard_dao.insert(vo);
		return "redirect:list.do";
	}
	
	//게시판의 상세페이지 조회
	@RequestMapping("/detail.do")
	public String view(int idx, Model model) {
		GameboardVO vo = gameboard_dao.selectone(idx);
		List<GameboardVO> list = gameboard_dao.selectReply(vo.getRef());
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
	//조회수 증가
	HttpSession session = request.getSession();
	String show = (String)session.getAttribute("show"); 		
		if(show == null) {
		int res = gameboard_dao.update_readhit(idx);
		session.setAttribute("show", "1");
		}
		request.setAttribute("vo", vo);
		
		return VIEW_PATH + "gameboard_detail.jsp";
	}
	


	//게시판 글수정화면
	 @RequestMapping("/edit_form.do")
	 public String gameboard_update(int idx, Model model){
		 GameboardVO vo = gameboard_dao.selectone(idx);
		 model.addAttribute("vo",vo);
	     return VIEW_PATH + "gameboard_edit.jsp";
	}
	 
	 //글 수정하기
	 @RequestMapping("/edit.do")
	 public String gameboard_edit(GameboardVO vo) {
		 int res = gameboard_dao.update(vo);
		 return "redirect:list.do";
	 }
	 
		
	 //글 삭제하기 
	  @RequestMapping("/del.do")
	  public String gameboard_delete(GameboardVO vo) {
		  gameboard_dao.del(vo.getGameboard_idx());
		  return "redirect:list.do";
		  }
		 
	//댓글작성 페이지
		@RequestMapping("/reply_form.do")
		public String reply(int idx) {
			return VIEW_PATH +"gameboard_reply.jsp?idx="+idx;
		}
		
	//댓글달기
	@RequestMapping("/reply.do")
	public String reply_write(GameboardVO vo,int idx) {
		
		System.out.println("idx : " + idx);
		//기준글 idx를 통해서 댓글을 달고싶은 게시물의 정보를 가져오기
		GameboardVO baseVO = gameboard_dao.selectone(idx);
		
		//기준글의 STEP보다 큰 값은 STEP=STEP +1처리
		gameboard_dao.update(baseVO);
		System.out.println("base:" + baseVO.getRef());
		System.out.println("base:" + baseVO.getTitle());
		//댓글이 들어갈 위치 선정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
		
		gameboard_dao.reply(vo);
		return "redirect:list.do";
	}
	
	//사진첨부
//	@RequestMapping("/gameboard_write2.do")
//	public String upload(GameboardVO vo) {
//		
//		String webPath = "/resources/upload/";
//		String savePath = application.getRealPath(webPath);//절대경로
//		
//		System.out.println("절대경로 : " +savePath);
//		
//		String filename_image = "no_file";
//		
//		//업로드를 위한 파일의 정보
//		MultipartFile photo = vo.getPhoto();
//		
//	
//		
//		//업로드할 파일이 존재한다면..
//		if(!photo.isEmpty()) {
//			//실제 업로드 된 파일명
//			filename_image = photo.getOriginalFilename();
//		
//			//저장할 파일의 경로
//			File saveFile = new File(savePath,filename_image);
//			
//			if(!saveFile.exists()) {
//				saveFile.mkdirs();
//			}else {
//				//같은 이름의 파일이 업로드 되려하면,이름에 업로드 시간을 붙여서 중복을 방지
//				long time = System.currentTimeMillis();
//				filename_image = String.format("%d_%s",time,filename_image);
//				saveFile= new File(savePath,filename_image);
//			}
//			try {
//				//photo가 가진 파일의 정보를 저장경로에 물리적으로 복사
//				photo.transferTo(saveFile);
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		}
//		vo.setFilename_image(filename_image);
//		
//		request.setAttribute("vo", vo);//바인딩
//		
//		return VIEW_PATH + "gameboard_list.jsp";
//	}//upload
}
