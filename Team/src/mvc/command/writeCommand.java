package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bbs.bbsDAO;


public class writeCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multi = null;

		String savePath = request.getSession().getServletContext().getRealPath("/upload");
		int size = 10 * 1024 * 1024;
		String bfile = "";
		String bfileReal = "";

		multi = new MultipartRequest(request, savePath, size, "UTF-8", new DefaultFileRenamePolicy());
		String bTitle1 = multi.getParameter("bTitle");
		bfile = multi.getOriginalFileName("file");
		bfileReal = multi.getFilesystemName("file");
		String bTitle = multi.getParameter("bTitle");
		String userID = multi.getParameter("userID");
		String bContent = multi.getParameter("bContent");


		bbsDAO bbsDAO = new bbsDAO();
		bbsDAO.write(bTitle, userID, bContent, bfile, bfileReal);

		System.out.println(bTitle);
		System.out.println(userID);
		System.out.println(bContent);

		if (bTitle.equals("") || bContent.equals("") || userID.equals("")) {
			request.setAttribute("Error", "0");
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("Error", "1");
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
			rd.forward(request, response);
		}

	}
}
