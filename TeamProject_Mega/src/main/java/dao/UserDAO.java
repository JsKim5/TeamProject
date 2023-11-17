package dao;

import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class UserDAO {
	SqlSession sqlSession;
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입 ?
	
	//아이디 찾기
	public String findId(String email) {
		return sqlSession.selectOne("u.find_id", email);
	}
	//비밀번호 찾기
	public String findPw(vo.UserVO vo) {
		return sqlSession.selectOne("u.find_pw",vo.getUser_id());
	}
	
	//비밀번호 변경
	
	//닉네임 변경
	
	//프사 변경
	
	
	
	//회원 탈퇴
	
	//유저 정보 조회
	public List<vo.UserVO> selectList() {
		List<vo.UserVO> list = sqlSession.selectOne("u.select_list");
		return list;
	}
	
}
