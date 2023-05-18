package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class MemberPhotoUpadteCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String realPath = request.getServletContext().getRealPath("/images/member");
//		String encoding = "UTF-8";
//		int maxSize = 1024 * 1024 * 5;	
//		
//		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
//		String filesystemName = multipartRequest.getFilesystemName("fName");
//		//파일 시스템에 해당 이름의 파일이 없으면 생성
//		if(filesystemName == null) filesystemName = multipartRequest.getParameter("fName");
//		
//		MemberDAO dao = new MemberDAO();
//		dao.setMemberPhotoUpdate(filesystemName);
	}

}
