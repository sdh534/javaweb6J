package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "WEB-INF/member";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberNickNameCheck")) {
			command = new MemberNickNameCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberPhotoUpdate")) {
			command = new MemberPhotoUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberLogoutOk")) {
			command = new MemberLogoutOkCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
