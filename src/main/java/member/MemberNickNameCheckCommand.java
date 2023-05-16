package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickNameCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName"); 
		MemberDAO dao = new MemberDAO();
		String res="";
		
		MemberVO vo = dao.getMemberNickNameCheck(nickName); //아이디 검색! 중복값이 있을 경우 NULL이 아닌 값 반환
		if(vo.getNickName() != null) { //중복된 아이디가 존재하면
			res="NO";
		}
		else { //중복된 아이디가 존재하지 않으면
			res="OK";
		}
		response.getWriter().write(res);

	}

}
