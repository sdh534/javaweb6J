package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.MovieDAO;

public class ReviewStarOkCommnad implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Double rating = request.getParameter("star")==null ? 0: Double.parseDouble(request.getParameter("star"));
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "": request.getParameter("nickName");
		int movieIdx = request.getParameter("movieIdx")==null ? 0: Integer.parseInt(request.getParameter("movieIdx"));
		
		System.out.println(rating +"/"+ mid +"/"+ nickName +"/"+ movieIdx);
		
		
		ReviewDAO dao = new ReviewDAO();
		ReviewVO vo = new ReviewVO();
		
		vo.setMovieIdx(movieIdx);
		vo.setRating(rating/2);
		vo.setMid(mid);
		vo.setNickName(nickName);
		
		//만약 이전에 사용자가 등록했던 별점이 없다면 새로 등록 
		ReviewVO checkVo = dao.getReview(mid, movieIdx);
		int res = 0;
		if(checkVo.getMid() == null) {
			res = dao.setReviewStarRating(vo);
		}
		//있다면 별점을 수정 
		else {
			res = dao.setUpdateReviewStarRating(vo);
		}
		//별점이 등록되면 movie 테이블의 평점또한 수정되어야 함-> 리뷰테이블에서 해당 영화를 가져와서 별점의 합산을 구한다
		double movieRating = Math.round(dao.getMovieReview(movieIdx));
		MovieDAO mDao = new MovieDAO();
		mDao.setMovieRatingUpdate(movieIdx, movieRating);
		response.getWriter().write(res+"");
	}

}
