package vo;

import org.springframework.web.multipart.MultipartFile;

public class GameVO {
	private MultipartFile game_img;
	
	private int game_idx;
	private String 
			game_name,
			game_platforms,
			game_genre,
			game_type,
			game_rating,
			game_developer,
			game_publisher,
			game_release_date,
			game_image_path,
			game_youtube_url;
	private int game_meta_score;
	private double game_user_score;
	
	
	
	public double getGame_user_score() {
		return game_user_score;
	}
	public void setGame_user_score(double game_user_score) {
		this.game_user_score = game_user_score;
	}
	public MultipartFile getGame_img() {
		return game_img;
	}
	public void setGame_img(MultipartFile game_img) {
		this.game_img = game_img;
	}
	public int getGame_idx() {
		return game_idx;
	}
	public void setGame_idx(int game_idx) {
		this.game_idx = game_idx;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public String getGame_platforms() {
		return game_platforms;
	}
	public void setGame_platforms(String game_platforms) {
		this.game_platforms = game_platforms;
	}
	public String getGame_genre() {
		return game_genre;
	}
	public void setGame_genre(String game_genre) {
		this.game_genre = game_genre;
	}
	public String getGame_type() {
		return game_type;
	}
	public void setGame_type(String game_type) {
		this.game_type = game_type;
	}
	public String getGame_rating() {
		return game_rating;
	}
	public void setGame_rating(String game_rating) {
		this.game_rating = game_rating;
	}
	public String getGame_developer() {
		return game_developer;
	}
	public void setGame_developer(String game_developer) {
		this.game_developer = game_developer;
	}
	public String getGame_publisher() {
		return game_publisher;
	}
	public void setGame_publisher(String game_publisher) {
		this.game_publisher = game_publisher;
	}
	public String getGame_release_date() {
		return game_release_date;
	}
	public void setGame_release_date(String game_release_date) {
		this.game_release_date = game_release_date;
	}
	public String getGame_image_path() {
		return game_image_path;
	}
	public void setGame_image_path(String game_image_path) {
		this.game_image_path = game_image_path;
	}
	public String getGame_youtube_url() {
		return game_youtube_url;
	}
	public void setGame_youtube_url(String game_youtube_url) {
		this.game_youtube_url = game_youtube_url;
	}
	public int getGame_meta_score() {
		return game_meta_score;
	}
	public void setGame_meta_score(int game_meta_score) {
		this.game_meta_score = game_meta_score;
	}	
	
}
