package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); 
		MemberDAO dao = new MemberDAO();
		String res="";
		
		MemberVO vo = dao.getMemberMidCheck(mid); //아이디 검색! 중복값이 있을 경우 NULL이 아닌 값 반환
		if(vo.getMid() != null) { //중복된 아이디가 존재하면
			res="NO";
		}
		else { //중복된 아이디가 존재하지 않으면
			res="OK";
		}
		response.getWriter().write(res);

		
	}

}
