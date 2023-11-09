package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GameVO;

public class GameDAO {
	SqlSession sqlSession;
	
	public GameDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<GameVO> select(){
		List<GameVO> list = sqlSession.selectList("g.selectGame");
		return list;
	}
}
