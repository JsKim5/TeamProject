package dao;

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
	
	public int insert(ReviewVO vo) {		
		int res = sqlSession.insert("r.review_insert", vo);
		return res;		
	}
	
	public ReviewVO selectOne(int idx) {
		ReviewVO vo = sqlSession.selectOne("r.review_one", idx);
		return vo;
	}
	
}
