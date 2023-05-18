package movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoviePageCommand implements MovieInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 1 : Integer.parseInt(request.getParameter("idx"));
		MovieDAO dao = new MovieDAO();
		
		MovieVO vo = dao.getMovieList(idx);
		
		if(vo.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
			String poster = vo.getPoster();
			poster = poster.substring(0, poster.indexOf("|"));
			vo.setPoster(poster);
		}
		request.setAttribute("vo", vo);
	}

}
