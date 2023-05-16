package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String salt;
	private String email;
	private String m_genre;
	private int m_level;
	private String nickName;
	private String userInfor;
	private String userDel;
	private String content;
	private String photo;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public int getM_level() {
		return m_level;
	}
	public void setM_level(int m_level) {
		this.m_level = m_level;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserInfor() {
		return userInfor;
	}
	public void setUserInfor(String userInfor) {
		this.userInfor = userInfor;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", salt=" + salt + ", email=" + email
				+ ", m_genre=" + m_genre + ", m_level=" + m_level + ", nickName=" + nickName + ", userInfor=" + userInfor
				+ ", userDel=" + userDel + ", content=" + content + ", photo=" + photo + "]";
	}
	
	
}
