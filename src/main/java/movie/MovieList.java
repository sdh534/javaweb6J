package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieList implements MovieInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieDAO dao = new MovieDAO();
		
		//main에 띄울 영화목록 1
		String category1 = "director";
		String keyword1 = "크리스토퍼 놀란"; 
		
		ArrayList<MovieVO> vos = dao.getMovieList(category1, keyword1);
		int cnt = 0;
		for(MovieVO vo : vos) {
			if(vo.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
				String poster = vo.getPoster();
				poster = poster.substring(0, poster.indexOf("|"));
				vo.setPoster(poster);
				vos.get(cnt).setPoster(poster);
			}
			cnt++;
		}
		System.out.println(vos);
		request.setAttribute("main1_vos", vos);
		
		
		//main에 띄울 영화 목록 2
		MovieVO vo = new MovieVO();
		ArrayList<MovieVO> vos2 = new ArrayList<>();
		vo = dao.getMovieList(1396);
		vos2.add(vo);
		vo = dao.getMovieList(4829);
		vos2.add(vo);
		vo = dao.getMovieList(4144);
		vos2.add(vo);
		vo = dao.getMovieList(14537);
		vos2.add(vo);
		vo = dao.getMovieList(13934);
		vos2.add(vo);
		vo = dao.getMovieList(14355);
		vos2.add(vo);
		vo = dao.getMovieList(1656);
		vos2.add(vo);
		vo = dao.getMovieList(6234);
		vos2.add(vo);
		vo = dao.getMovieList(14601);
		vos2.add(vo);
		vo = dao.getMovieList(14619);
		vos2.add(vo);
		
		cnt=0;
		for(MovieVO vo2 : vos2) {
			if(vo2.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
				String poster = vo2.getPoster();
				poster = poster.substring(0, poster.indexOf("|"));
				vo2.setPoster(poster);
				vos2.get(cnt).setPoster(poster);
			}
			cnt++;
		}
		request.setAttribute("main2_vos", vos2);

		//main에 띄울 영화 목록 3
		
		
	}

}
