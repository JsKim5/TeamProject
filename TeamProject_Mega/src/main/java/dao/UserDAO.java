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
	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.insert", vo);
		return res;
	}
	
	//아이디 찾기
	public String selectId(String email) {
		String id =  sqlSession.selectOne("u.select_id", email);
		return id;
	}
	
	//비밀번호 찾기
	public String selectPw(UserVO vo) {
		String pw = sqlSession.selectOne("u.select_pw",vo.getUser_id());
		return pw;
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
