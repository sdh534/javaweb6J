package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.ReviewDAO;
import review.ReviewVO;

public class AdminReviewListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ReviewDAO dao = new ReviewDAO();
			

			// 페이징처리...
			int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
			int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
			int totRecCnt = dao.getAllReview();
			int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
			
			// 블록페이징처리....
			int blockSize = 5;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage - 1) / blockSize;
			
			ArrayList<ReviewVO> vos = dao.getAllReview(startIndexNo, pageSize);
			request.setAttribute("vos", vos);
			
			request.setAttribute("pag", pag);
			request.setAttribute("startIndexNo", startIndexNo);
			request.setAttribute("totPage", totPage);
			request.setAttribute("curScrStartNo", curScrStartNo);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("lastBlock", lastBlock);
	}

}
