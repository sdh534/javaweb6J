package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ReviewDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ReviewVO vo= new ReviewVO();

	//입력한 별점을 등록(최초 1회) 
	public int setReviewStarRating(ReviewVO vo) {
		int res = 0;
		
		try {
			sql = "insert into review values(default, ?, ?, ?, '', ?, default, default, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMovieIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNickName());
			pstmt.setDouble(4, vo.getRating());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	//해당 사용자가 입력한 리뷰를 조회 
	public ReviewVO getReview(String sMid, int idx) {
		vo = new ReviewVO();
		
		try {
			sql = "select review.*, member.photo from member cross join review on review.mid=member.mid"
					+ " where review.mid = ? and movieIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sMid);
			pstmt.setInt(2, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMovieIdx(rs.getInt("movieIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setContext(rs.getString("context"));
				vo.setRating(rs.getDouble("rating"));
				vo.setwDate(rs.getString("wDate"));
				vo.setThumb(rs.getInt("thumb"));
				vo.setSpoiler(rs.getInt("spoiler"));
				vo.setReviewDel(rs.getInt("reviewDel"));
				vo.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}
	
	//입력한 별점이 있다면 별점을 수정 

	public int setUpdateReviewStarRating(ReviewVO vo) {
	int res = 0;
		
		try {
			sql = "update review set rating = ? where mid =? and movieIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, vo.getRating());
			pstmt.setString(2, vo.getMid());
			pstmt.setInt(3, vo.getMovieIdx());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	//해당 영화 리뷰의 평점을 계산
	public double getMovieReview(int movieIdx) {
		double res=0;
		try {
			sql = "select avg(rating) as rating from review where movieIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = rs.getDouble("rating");
				System.out.println(res);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return res;
	}

	//코멘트 입력시 수정
	public int setUpdateReviewComment(ReviewVO vo) {
		int res = 0;
		try {
			sql = "update review set rating = ?, context = ?, spoiler=?  where mid =? and movieIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, vo.getRating());
			pstmt.setString(2, vo.getContext());
			pstmt.setInt(3, vo.getSpoiler());
			pstmt.setString(4, vo.getMid());
			pstmt.setInt(5, vo.getMovieIdx());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}


		public ArrayList<ReviewVO> getMovieReviewList(int idx) {
			ArrayList<ReviewVO> vos = new ArrayList<>();
			try {
				sql = "select review.*, member.photo from member cross join review on review.mid = member.mid where movieIdx=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					vo = new ReviewVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMovieIdx(rs.getInt("movieIdx"));
					vo.setMid(rs.getString("mid"));
					vo.setNickName(rs.getString("nickName"));
					vo.setContext(rs.getString("context"));
					vo.setRating(rs.getDouble("rating"));
					vo.setwDate(rs.getString("wDate"));
					vo.setThumb(rs.getInt("thumb"));
					vo.setSpoiler(rs.getInt("spoiler"));
					vo.setReviewDel(rs.getInt("reviewDel"));
					vo.setPhoto(rs.getString("photo"));
					vos.add(vo);
				}
			}catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vos;
		}
	
	
	
}
