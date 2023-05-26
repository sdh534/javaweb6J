package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ad")
public class AdminController  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "WEB-INF/admin";
		AdminInterface command = null;
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/AdminMain")) {
			viewPage += "/adminPage.jsp";
		}	
		else if(com.equals("/AdminHome")) {
			viewPage += "/adminHome.jsp";
		}	
		else if(com.equals("/AdminReviewList")) {
			command = new AdminReviewListCommand();
			command.execute(request, response);			
			viewPage += "/adminReviewList.jsp";
		}	
		else if(com.equals("/AdminMemberList")) {
			command = new AdminMemberListCommand();
			command.execute(request, response);			
			viewPage += "/adminMemberList.jsp";
		}	
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
