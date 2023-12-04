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
	public UserVO selectId(UserVO vo) {
		UserVO id =  sqlSession.selectOne("u.select_id", vo);
		return id;
	}

	//비밀번호 찾기
	public UserVO selectPw(UserVO vo) {
		UserVO pw = sqlSession.selectOne("u.select_pw",vo);
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
	
	/*
	 * //비밀번호 찾기 후 변경 public int modifypw(UserVO vo) { int modify =
	 * sqlSession.update("u.user_modifypw", vo); return modify; }
	 */
	
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
	
	//닉네임 중복검사
	public int checknickname(UserVO vo) {
		int check = sqlSession.selectOne("u.check_nickname", vo);
		return check;
	}
	
	
}
