package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudyInterface command = null;
		String viewPage = "WEB-INF/study";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/MovieAPI")) {
//			command = new StudyMovieAPI();
//			command.execute(request, response);
			viewPage += "/study2.jsp";
		}
		
		else if(com.equals("/MovieAPI2")) {
			command = new StudyMovieAPI();
			command.execute(request, response);
			viewPage += "/study2.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
