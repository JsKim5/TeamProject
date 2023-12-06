package vo;

import org.springframework.web.multipart.MultipartFile;

public class GameboardVO {
	private int gameboard_idx,readhit,ref,step,depth,user_num,
		user_goody,user_goodn,del,del_info;
	private String user_id,title,content,pwd,regdate,user_write_useyn,game_name;
	MultipartFile photo;//파일을 받기위한 자료형
	String filename_image;//업로드할 파일명;
		
	
	
	
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public String getFilename_image() {
		return filename_image;
	}
	public void setFilename_image(String filename_image) {
		this.filename_image = filename_image;
	}
	public int getDel_info() {
		return del_info;
	}
	public void setDel_info(int del_info) {
		this.del_info = del_info;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getGameboard_idx() {
		return gameboard_idx;
	}
	public void setGameboard_idx(int gameboard_idx) {
		this.gameboard_idx = gameboard_idx;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getUser_goody() {
		return user_goody;
	}
	public void setUser_goody(int user_goody) {
		this.user_goody = user_goody;
	}
	public int getUser_goodn() {
		return user_goodn;
	}
	public void setUser_goodn(int user_goodn) {
		this.user_goodn = user_goodn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUser_write_useyn() {
		return user_write_useyn;
	}
	public void setUser_write_useyn(String user_write_useyn) {
		this.user_write_useyn = user_write_useyn;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	 
}
