package review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.re")
public class ReviewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ReviewInterface command = null;
		String viewPage = "WEB-INF/review";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/ReviewStarOk")) {
			command = new ReviewStarOkCommnad();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewUpdateComment")) {
			command = new ReviewUpdateCommentCommnad();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewLikeCheck")) {
			command = new ReviewLikeCheckCommnad();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewWarnComment")) {
			command = new ReviewWarnCommentCommnad();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewWarnList")) {
			command = new ReviewWarnListCommnad();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewDeleteOk")) {
			command = new ReviewDeleteOkCommnad();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
