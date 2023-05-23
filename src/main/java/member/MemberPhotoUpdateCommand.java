package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberPhotoUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		String encoding = "UTF-8";
		int maxSize = 1024 * 1024 * 5;	
		
		System.out.println(request.getContentType());
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, policy);
		System.out.println(multipartRequest.getFilesystemName("profile"));
		String filesystemName = multipartRequest.getFilesystemName("profile");
		//파일 시스템에 해당 이름의 파일이 없으면 생성
		if(filesystemName == null) filesystemName = multipartRequest.getParameter("profile");
//		
		String originalFileName = multipartRequest.getOriginalFileName("profile");
		
		System.out.println("원본 파일명: " + originalFileName);
		System.out.println("서버의 저장 경로 : "+realPath);
		System.err.println("서버에 저장된 파일명 : " + filesystemName);
		MemberDAO dao = new MemberDAO();
		dao.setMemberPhotoUpdate(filesystemName, mid);
		session.setAttribute("sPhoto", filesystemName);
		if (!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
			System.out.println(filesystemName);
		}
	}

}
