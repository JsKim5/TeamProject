package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GameBoardPagingVO;
import vo.GameboardVO;

public class GameboardDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시글 조회
	public List<GameboardVO> selectList(GameBoardPagingVO pvo){
		List<GameboardVO> list = sqlSession.selectList("b.gameboard_list",pvo);
		return list;
	}
	
	//전체 게시글 수 조회
	public int getRowTotal(String game_name) {
		int count = sqlSession.selectOne("b.gameboard_count",game_name);
		return count;
	}
	
	//조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("b.gameboard_update_readhit",idx);
		return res;
	}
	
	// 데이터 vo.으로가져오기
	public GameboardVO selectone(int idx) {
		GameboardVO vo=sqlSession.selectOne("b.gameboard_one",idx);
		return vo;
	}
	
	public int insert(GameboardVO vo) {
		int res = sqlSession.insert("b.gameboard_insert",vo);
		return res;
	}
	// 게시판 수정 업데이트
	public int update(GameboardVO vo) {
		int res = sqlSession.update("b.gameboard_update",vo);
		return res;
	}
	//게시판  글 삭제
	public int del(int idx) {
		int res = sqlSession.delete("b.gameboard_delete",idx);
		return res;
	}
	//댓글을 위한 step값 증가
	public int update_step(GameboardVO vo) {
		int res = sqlSession.update("b.gameboard_update_step",vo);
		return res;
	}
	//댓글 추가하기
	public int reply(GameboardVO vo) {
		int res = sqlSession.insert("b.gameboard_reply",vo);   
		return res;
	}
	// 댓글 가져오기
	public List<GameboardVO> selectReply(int ref){
		List<GameboardVO> list = sqlSession.selectList("b.gameboard_reply_list",ref);
		return list;
	}
	//게임목록 등록
	
	  public List<GameboardVO> game_name(GameboardVO vo){ 
		  List<GameboardVO> game_name = sqlSession.selectList("b.gameboard_game_name",vo.getGame_name()); 
		  return game_name; 
	}
	  
	 //사진등록
		/*
		 * public List<GameboardVO> filename_image(GameboardVO vo){ List<GameboardVO>
		 * filename_image=sqlSession.selectList("b.gameboard_filename_image",vo); return
		 * filename_image; }
		 */
	 
}
