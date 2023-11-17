package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

import java.util.List;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입
	public int JoinId(vo.UserVO vo) {
		return sqlSession.insert("u.insert", vo);
	}
	
	//아이디 찾기
	public String selectId(String email) {
		return sqlSession.selectOne("u.select_id", email);
	}
	
	//비밀번호 찾기
	public String selectPw(vo.UserVO vo) {
		return sqlSession.selectOne("u.select_pw",vo.getUser_id());
	}
	
	//비밀번호 변경
	
	//닉네임 변경
	
	//회원 탈퇴
	public 
	
	//마이페이지
	public vo.UserVO selectOne(String id) {
		vo.UserVO vo = sqlSession.selectOne("u.select_list", id);
		return vo;
		
	}
	
}
