package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		String res = "";
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid); //아이디 검색! 중복값이 있을 경우 NULL이 아닌 값 반환
		if(vo.getMid()==null) {
			res="0"; //가입된 아이디가 존재하지 않음
			response.getWriter().write(res);
			return;
		}
		
		//비밀번호 암호화처리(sha256)
			UUID uid = UUID.randomUUID();
			String salt = vo.getSalt();
			pwd = salt + pwd;
			
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			
			if(!vo.getPwd().equals(pwd)) {
				res="1"; //비밀번호가 일치하지 않음 
				response.getWriter().write(res);
				return;
			}
			
		//이 외의 경우: 로그인 성공! 세션 처리해주기
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getM_level()+"");
			session.setAttribute("sPhoto", vo.getPhoto());
			res="2"; //로그인 성공 
			response.getWriter().write(res);
	}
}
