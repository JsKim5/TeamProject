package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입
	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.user_insert", vo);
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
	
	//로그인
	public UserVO login(UserVO vo) {
		UserVO login = sqlSession.selectOne("u.user_login", vo);
		return login;
	}
	
	//회원 정보 수정
	public int modify(UserVO vo) {
		int update = sqlSession.update("u.user_modify", vo);
		return update;
	}
	
	//사진 수정
	public int image(UserVO vo) {
		int res = sqlSession.update("u.user_modify_image", vo);
		return res;
	}
	
	//회원 탈퇴
	public int delete(UserVO vo) {
		int delete = sqlSession.delete("u.delete_id", vo);
		return delete;
	}
	
	//아이디 중복검사
	public int checkid(UserVO vo) {
		int check = sqlSession.selectOne("u.check_id", vo);
		return check;
	}
}
