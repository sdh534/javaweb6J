package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.MovieInterface;
import movie.MovieList;

@WebServlet("/Main")
public class MainController  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "WEB-INF/main.jsp";
		MovieInterface command = null;
		
		command = new MovieList();
		command.execute(request, response);
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
