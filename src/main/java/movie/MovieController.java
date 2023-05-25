package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberNickNameCheckCommand;

@WebServlet("*.mo")
public class MovieController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieInterface command = null;
		String viewPage = "WEB-INF/movie";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		

		if(com.equals("/MoviePage")) {
			command = new MoviePageCommand();
			command.execute(request, response);
			viewPage += "/moviePage.jsp";
		}
		else if(com.equals("/MovieSearch")) {
			command = new MovieSearchCommand();
			command.execute(request, response);
			viewPage = "/MoviePage.mo?idx="+request.getAttribute("idx");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
