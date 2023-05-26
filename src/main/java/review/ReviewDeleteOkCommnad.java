package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewDeleteOkCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		int res = dao.setDeleteReview(idx);
		response.getWriter().write(res+"");
	}

}
