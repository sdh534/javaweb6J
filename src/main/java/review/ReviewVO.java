package review;

public class ReviewVO {
	private int idx;
	private int movieIdx;
	private String mid;
	private String nickName;
	private String context;
	private double rating;
	private String wDate;
	private int thumb;
	private int spoiler;
	private int reviewDel;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getThumb() {
		return thumb;
	}
	public void setThumb(int thumb) {
		this.thumb = thumb;
	}
	public int getSpoiler() {
		return spoiler;
	}
	public void setSpoiler(int spoiler) {
		this.spoiler = spoiler;
	}
	public int getReviewDel() {
		return reviewDel;
	}
	public void setReviewDel(int reviewDel) {
		this.reviewDel = reviewDel;
	}
	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", movieIdx=" + movieIdx + ", mid=" + mid + ", nickName=" + nickName + ", context="
				+ context + ", rating=" + rating + ", wDate=" + wDate + ", thumb=" + thumb + ", spoiler=" + spoiler
				+ ", reviewDel=" + reviewDel + "]";
	}
	
}
