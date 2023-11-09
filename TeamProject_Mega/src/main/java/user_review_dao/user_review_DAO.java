package user_review_dao;

import org.apache.ibatis.session.SqlSession;

public class user_review_DAO {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
