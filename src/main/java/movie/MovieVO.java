package movie;

public class MovieVO {
	private int idx;
	private String title;
	private int rYear;
	private String country;
	private String genre;
	private String director;
	private String actor;
	private String keyword;
	private String story;
	private String poster;
	private double rating;
	private int runtime;
	
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getrYear() {
		return rYear;
	}
	public void setrYear(int rYear) {
		this.rYear = rYear;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "MovieVO [idx=" + idx + ", title=" + title + ", rYear=" + rYear + ", country=" + country + ", genre=" + genre
				+ ", director=" + director + ", actor=" + actor + ", keyword=" + keyword + ", story=" + story + ", poster="
				+ poster + ", rating=" + rating + ", runtime=" + runtime + "]";
	}
	
	
	
}
