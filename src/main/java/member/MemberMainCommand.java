package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.ReviewDAO;
import review.ReviewVO;


public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		ReviewDAO rDao = new ReviewDAO();
		
		//평가한 영화 수,리뷰를 가져옴
		ArrayList<ReviewVO> rVos = rDao.getReview(mid);
		//이중 영화 수만 구하려면 ArrayList의 크기로
		int mCnt = rVos.size();
		//코멘트가 존재하는 리뷰 수만 구하려면 context!=""인 값을 찾는다
		int rCnt = 0;
		for(ReviewVO rVO : rVos) {
			if(rVO.getContext()!="") {
				rCnt++;
			}
		}
		
		//평가한 영화가 5개 이상이고 & 선호 장르 설정을 하지 않았다면 자동으로 설정
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("mCnt", mCnt);
		request.setAttribute("rCnt", rCnt);
	}

}
