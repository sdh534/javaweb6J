package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd"); 
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName"); 
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		String msg="";
		
		// 비밀번호 암호화처리(sha256)
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);

		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setSalt(salt);
		vo.setEmail(email);
		vo.setNickName(nickName);
		
		MemberDAO dao = new MemberDAO();
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 1) {
			msg="회원가입을 축하합니다! \n 재로그인 후 서비스를 이용하실 수 있습니다.";
		}
		else {
			msg="회원가입 중 오류가 발생했습니다. 다시 시도해주세요.";
		}
		
		response.getWriter().write(msg);

	}

}
