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
	public List<ReviewVO> selectList(){
		List<ReviewVO> list = sqlSession.selectList("r.review_list");
		return list;
	}
	
}
