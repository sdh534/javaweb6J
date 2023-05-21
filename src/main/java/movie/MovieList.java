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
		vos = dao.getMovieList("title", "라라랜드");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "바빌론");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "시카고");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "사랑은 비를 타고");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "코코");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "타이타닉");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "이터널 선샤인");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "비긴 어게인");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "아가씨");
		vos2.addAll(vos);
		vos = dao.getMovieList("title", "가디언즈 오브 갤럭시");
		vos2.addAll(vos);
		
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

		//main에 띄울 영화 목록 3
		
		
	}

}
