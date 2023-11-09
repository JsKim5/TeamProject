package userdao;

import org.apache.ibatis.session.SqlSession;

import com.sun.tools.javac.util.List;

import uservo.UserVO;

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
	public String findPw(UserVO vo) {
		return sqlSession.selectOne("u.find_pw",vo.getUser_id());
	}
	
	//비밀번호 변경
	
	//닉네임 변경
	
	//프사 변경
	
	
	
	//회원 탈퇴
	
	//유저 정보 조회
	public List<UserVO> selectList() {
		List<UserVO> list = sqlSession.selectOne("u.select_list");
		return list;
	}
	
}
