package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie.MovieDAO;
import movie.MovieVO;
import review.ReviewDAO;
import review.ReviewVO;

public class MemberReviewListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		//Id를 통해서 작성한 모든 리뷰를 가져온다 
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO>	rVos = dao.getReview(mid);
				
		//작성한 리뷰의 영화를 전부 가져온다
		MovieDAO mDao = new MovieDAO();
		ArrayList<MovieVO> mVos= new ArrayList<>();
		
		for(ReviewVO rVo : rVos) {
			MovieVO vo = mDao.getMovieList(rVo.getMovieIdx());
			
			if(vo.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
				String poster = vo.getPoster().substring(0, vo.getPoster().indexOf("|"));
				vo.setPoster(poster);
			}
			
			mVos.add(vo);
		}
		
		request.setAttribute("rVos", rVos);
		request.setAttribute("mVos", mVos);
	}

}
