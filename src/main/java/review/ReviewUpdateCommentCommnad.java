package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewUpdateCommentCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Double rating = request.getParameter("star")==null ? 0: Double.parseDouble(request.getParameter("star"));
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "": request.getParameter("nickName");
		int movieIdx = request.getParameter("movieIdx")==null ? 0: Integer.parseInt(request.getParameter("movieIdx"));
		String review = request.getParameter("review")==null ? "": request.getParameter("review");
		String spoilerCheck = request.getParameter("spoiler") == null ? "" : request.getParameter("spoiler");
		
		int spoiler = spoilerCheck.equals("true") ? 1 : 0; //스포일러 체크가 참일 경우 1, 아닐 경우 0
		
		ReviewDAO dao = new ReviewDAO();
		ReviewVO vo = new ReviewVO();
		
		vo.setMovieIdx(movieIdx);
		vo.setRating(rating/2);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setContext(review);
		vo.setSpoiler(spoiler);
		
		int res = 0;
		res = dao.setUpdateReviewComment(vo);
		
		response.getWriter().write(res+"");
	}

}
