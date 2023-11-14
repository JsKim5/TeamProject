package vo;

public class ReviewVO {
	
	int review_idx;
	double user_score;
	String user_review;
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public double getUser_score() {
		return user_score;
	}
	public void setUser_score(double user_score) {
		this.user_score = user_score;
	}
	public String getUser_review() {
		return user_review;
	}
	public void setUser_review(String user_review) {
		this.user_review = user_review;
	}
 
}
