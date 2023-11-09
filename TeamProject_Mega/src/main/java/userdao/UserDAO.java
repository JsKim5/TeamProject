package userdao;

import org.apache.ibatis.session.SqlSession;

import com.sun.tools.javac.util.List;

import uservo.UserVO;

public class UserDAO {
	SqlSession sqlSession;
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입
	
	//비밀번호 변경
	
	//닉네임 변경
	
	//회원 탈퇴
	
	//유저 정보 조회
	public List<UserVO> selectList() {
		List<UserVO> list = sqlSession.selectOne("u.select_list");
		return list;
	}
	
}
