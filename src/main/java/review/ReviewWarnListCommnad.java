package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWarnListCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rIdx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		ReviewDAO dao = new ReviewDAO();
		
		String delContent = dao.getReviewDelContent(rIdx);
		delContent= delContent.substring(0,delContent.length()-1);
		request.setAttribute("delContent", delContent);
		
	}

}
