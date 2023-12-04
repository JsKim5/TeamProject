package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {
	
	SqlSession sqlSession;
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//전체 리뷰 조회
	public List<ReviewVO> selectList(String game_name){
		List<ReviewVO> list = sqlSession.selectList("r.review_list", game_name);
		return list;
	}
	
	public List<ReviewVO> selectList_AL(HashMap<String, Integer> map){
		List<ReviewVO> list = sqlSession.selectList("r.review_AL", map);
		return list;
	}
	
	public int insert(ReviewVO vo) {		
		int res = sqlSession.insert("r.review_insert", vo);
		return res;		
	}
	
	public ReviewVO selectOne(int idx) {
		ReviewVO vo = sqlSession.selectOne("r.review_one", idx);
		return vo;
	}
	
	public int deleteAD(int idx) {
		int res = sqlSession.delete("r.deleteReviewAD", idx);
		return res;
	}
	
	public int review_countAL() {
		int res = sqlSession.selectOne("r.review_countAL");
		return res;
	}
	
	public int user_scoreAVG(String game_name) {
		int res = sqlSession.selectOne("r.user_scoreAVG", game_name);
		return res;
	}
	
	public int scoreAVG_update(String game_name) {
		int res = sqlSession.update("r.scoreAVG_update", game_name);
		return res;
	}
	
}
