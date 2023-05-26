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
	private String photo;
	private String reviewDelContent;
	
	private int rCount; //회원이 작성한 리뷰의 수를 반환
	private int mCount; //회원이 작성한 평가한 영화의 수를 반환
	
	
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public int getmCount() {
		return mCount;
	}
	public void setmCount(int mCount) {
		this.mCount = mCount;
	}
	public String getReviewDelContent() {
		return reviewDelContent;
	}
	public void setReviewDelContent(String reviewDelContent) {
		this.reviewDelContent = reviewDelContent;
	}
	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", movieIdx=" + movieIdx + ", mid=" + mid + ", nickName=" + nickName + ", context="
				+ context + ", rating=" + rating + ", wDate=" + wDate + ", thumb=" + thumb + ", spoiler=" + spoiler
				+ ", reviewDel=" + reviewDel + ", photo=" + photo + ", reviewDelContent=" + reviewDelContent + ", rCount="
				+ rCount + ", mCount=" + mCount + "]";
	}

	
	
	
}
