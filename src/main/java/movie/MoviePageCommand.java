package movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.ReviewDAO;
import review.ReviewVO;

public class MoviePageCommand implements MovieInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 1 : Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		MovieDAO dao = new MovieDAO();
		
		MovieVO vo = dao.getMovieList(idx);
		
		if(vo.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
			String poster = vo.getPoster();
			poster = poster.substring(0, poster.indexOf("|"));
			vo.setPoster(poster);
		}
		request.setAttribute("vo", vo);
		
		
		//현재 로그인한 사용자의 별점 내역과 코멘트 내용을 함께 가져와야 함
		ReviewDAO rDao = new ReviewDAO();
		ReviewVO memberRVo = rDao.getReview(sMid, idx);
		
		request.setAttribute("memberRVo", memberRVo);
		
		
		//리뷰 테이블의 정보도 함께 가져와야 함(평점 띄워 줘야 하닊가...) 
//		dao.getMovieReviewList
	}

}
