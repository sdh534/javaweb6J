package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.ReviewDAO;
import review.ReviewVO;

public class MovieSearchCommand implements MovieInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		
		MovieDAO dao = new MovieDAO();
		
		String[] mSearchWord = searchWord.split("\\(");
		String title = mSearchWord[0].trim();
		int rYear = Integer.parseInt(mSearchWord[1].substring(0,4));
		System.out.println(mSearchWord[0]);
		System.out.println(rYear);
		
		//제목과 개봉년도로 검색 
		MovieVO vo = dao.searchMovie(title, rYear);
		System.out.println(vo);
		
		request.setAttribute("idx", vo.getIdx());
	}

}
