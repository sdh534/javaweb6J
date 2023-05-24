package review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewLikeCheckCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		String sw = "0";
		System.out.println(idx);
		ReviewDAO dao = new ReviewDAO();
		ArrayList<String> likeReviewIdx = (ArrayList) session.getAttribute("likeReviewIdx");
		
		String tempIdx = "review"+idx;
		if(likeReviewIdx == null) likeReviewIdx = new ArrayList<String>(); //좋아요를 누른 적이 없다면 세션에 한번 생성해주고
		if(!likeReviewIdx.contains(tempIdx)) { //생성한 값에 리뷰의 고유번호가 없다면 좋아요 증가
			dao.setReviewLikeUpdate(idx);
			likeReviewIdx.add(tempIdx);
			sw="1";
		}
		session.setAttribute("likeReviewIdx", likeReviewIdx);
		System.out.println(session.getAttribute("likeReviewIdx"));
		
		response.getWriter().write(sw); //눌렀으면 1반환 , 처음이면 0반환
	}

}
