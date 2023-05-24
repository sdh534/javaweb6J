package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;


	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setSalt(rs.getString("salt"));
				vo.setEmail(rs.getString("email"));
				vo.setM_genre(rs.getString("m_genre"));
				vo.setM_level(rs.getInt("m_level"));
				vo.setNickName(rs.getString("nickName"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}


	public MemberVO getMemberNickNameCheck(String nickName) {
		vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setSalt(rs.getString("salt"));
				vo.setEmail(rs.getString("email"));
				vo.setM_genre(rs.getString("m_genre"));
				vo.setM_level(rs.getInt("m_level"));
				vo.setNickName(rs.getString("nickName"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}


	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default, ?, ?, ?, ?, '', default, ?, default, default, '', default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getSalt());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getNickName());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}



	public void setMemberPhotoUpdate(String filesystemName, String mid) {
		try {
			sql = "update member set photo = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filesystemName);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}


}
