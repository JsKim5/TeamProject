package vo;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private MultipartFile user_image;
	
	private int user_idx;
	private String user_name,user_pwd,user_regdate,user_nickname,
					user_image_path,user_email,user_id,user_ip,user_email2;
	
	//user_email2 임시로 넣음
	
	public MultipartFile getUser_image() {
		return user_image;
	}
	
	
	public String getUser_email2() {
		return user_email2;
	}
	public void setUser_email2(String user_email2) {
		this.user_email2 = user_email2;
	}
	
	
	
	public void setUser_image(MultipartFile user_image) {
		this.user_image = user_image;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_image_path() {
		return user_image_path;
	}
	public void setUser_image_path(String user_image_path) {
		this.user_image_path = user_image_path;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	
	
	
	
}
