package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

public class MovieList implements MovieInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long start = System.currentTimeMillis();
		
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
		request.setAttribute("main1_vos", vos);
		
		
		//main에 띄울 영화 목록 2
		MovieVO vo = new MovieVO();
		ArrayList<MovieVO> vos2 = new ArrayList<>();
		vo = dao.getMovieList(1758);
		vos2.add(vo);
		vo = dao.getMovieList(5889);
		vos2.add(vo);
		vo = dao.getMovieList(14447);
		vos2.add(vo);
		vo = dao.getMovieList(17913);
		vos2.add(vo);
		vo = dao.getMovieList(17926);
		vos2.add(vo);
		vo = dao.getMovieList(17223);
		vos2.add(vo);
		vo = dao.getMovieList(1803);
		vos2.add(vo);
		vo = dao.getMovieList(3977);
		vos2.add(vo);
		vo = dao.getMovieList(5268);
		vos2.add(vo);
		vo = dao.getMovieList(4013);
		vos2.add(vo);
		
		cnt=0;
		for(MovieVO vo2 : vos2) {
			if(vo2.getPoster().contains("|")&&vo2.getPoster()!=null) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
				String poster = vo2.getPoster();
				poster = poster.substring(0, poster.indexOf("|"));
				vo2.setPoster(poster);
				vos2.get(cnt).setPoster(poster);
			}
			cnt++;
		}
		request.setAttribute("main2_vos", vos2);

		//main에 띄울 영화 목록 3 - 최근 리뷰가 등록된 영화
		ArrayList<MovieVO> vos3 = dao.getMovieListLastReview();
		cnt = 0;
		for(MovieVO vo3 : vos3) {
			if(vo3.getPoster().contains("|")) { //포스터가 여러개로 존재하면 그중 하나만 가져오기
				String poster = vo3.getPoster();
				poster = poster.substring(0, poster.indexOf("|"));
				vo3.setPoster(poster);
				vos3.get(cnt).setPoster(poster);
			}
			cnt++;
		}
		request.setAttribute("main3_vos", vos3);
		
		
		
		HttpSession session = request.getSession();
		//자동검색을 위해 모든 값을 가져와서 배열에 뿌려줘야함 
		if(session.getAttribute("searchTitle")==null) {
		ArrayList<String> searchTitle = dao.getMovieTitle();
		String[] array = searchTitle.toArray(new String[searchTitle.size()]);
		String searchTitles = String.join(",", array);
		session.setAttribute("searchTitles", searchTitles);
		}
		
		
		
		
		
		
		long end = System.currentTimeMillis();
		System.out.println( "실행 시간 : " + ( end - start )/1000.0 +"초");

	}

}
