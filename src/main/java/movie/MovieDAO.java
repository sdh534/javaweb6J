package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MovieDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MovieVO vo = null;

//영화 DB 채우기 
	public void setMovieDB(MovieVO vo) {
		try {
			sql = "insert into movie values (default, ?, ?, ?, ?, ?, ?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setInt(2, vo.getrYear());
			pstmt.setString(3, vo.getCountry());
			pstmt.setString(4, vo.getGenre());
			pstmt.setString(5, vo.getDirector());
			pstmt.setString(6, vo.getActor());
			pstmt.setString(7, vo.getKeyword());
			pstmt.setString(8, vo.getStory());
			pstmt.setString(9, vo.getPoster());
			pstmt.executeUpdate();
			System.out.println(vo.getTitle()+"입력완료");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

//영화 검색, 키워드와 검색할 단어를 입력받음 
	public ArrayList<MovieVO> getMovieList(String category1, String keyword1) {
		ArrayList<MovieVO> vos = new ArrayList<>();
		try {
			sql = "select * from movie where " + category1 + " = ? order by rYear desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword1);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new MovieVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setrYear(rs.getInt("rYear"));
				vo.setCountry(rs.getString("country"));
				vo.setGenre(rs.getString("genre"));
				vo.setDirector(rs.getString("director"));
				vo.setActor(rs.getString("actor"));
				vo.setKeyword(rs.getString("keyword"));
				vo.setStory(rs.getString("story"));
				vo.setPoster(rs.getString("poster"));
				vo.setRating(rs.getDouble("rating"));
				vos.add(vo);
			}
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vos;
	}

// 영화 상세페이지용 -  idx로 조회
	public MovieVO getMovieList(int idx) {
		vo = new MovieVO();
		try {
			sql = "select * from movie where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setrYear(rs.getInt("rYear"));
				vo.setCountry(rs.getString("country"));
				vo.setGenre(rs.getString("genre"));
				vo.setDirector(rs.getString("director"));
				vo.setActor(rs.getString("actor"));
				vo.setKeyword(rs.getString("keyword"));
				vo.setStory(rs.getString("story"));
				vo.setPoster(rs.getString("poster"));
				vo.setRating(rs.getDouble("rating"));
			}
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vo;
	}

}
