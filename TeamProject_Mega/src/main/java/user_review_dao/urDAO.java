package user_review_dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import user_review_vo.urVO;

public class urDAO {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<urVO> selectList(HashMap<String, Integer> map){
		List<urVO> list = sqlSession.selectList("r.user_review_list", map);
		return list;
	}

}
