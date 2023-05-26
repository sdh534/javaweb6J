package review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewWarnCommentCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rIdx = request.getParameter("reviewIdx")==null ? 0 : Integer.parseInt(request.getParameter("reviewIdx"));
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String warn = request.getParameter("warn")==null ? "": request.getParameter("warn");
		
		ReviewDAO dao = new ReviewDAO();
		
		
		HttpSession session = request.getSession();
		ArrayList<String> WarnReviewIdx = (ArrayList) session.getAttribute("WarnReviewIdx");
		String sw="0";
		String tempIdx = "review"+rIdx;
		if(WarnReviewIdx == null) WarnReviewIdx = new ArrayList<String>(); //신고핝 적이 없다면 세션에 한번 생성해주고
		if(!WarnReviewIdx.contains(tempIdx)) { //생성한 값에 리뷰의 고유번호가 없다면 좋아요 증가
			dao.setReviewWarnUpdate(rIdx, mid, warn);
			WarnReviewIdx.add(tempIdx);
			sw="1";
		}
		session.setAttribute("WarnReviewIdx", WarnReviewIdx);
		
		
		response.getWriter().write(sw+"");
	}

}
