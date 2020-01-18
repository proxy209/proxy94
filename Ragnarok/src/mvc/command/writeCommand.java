package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.BbsDAO;

public class writeCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String bbsTitle = request.getParameter("bbsTitle");
		String userID = request.getParameter("userID");
		String bbsContent = request.getParameter("bbsContent");
		BbsDAO bbsDAO = new BbsDAO();
		bbsDAO.write(bbsTitle, userID, bbsContent);

       if(bbsTitle.equals("") || bbsContent.equals("") || userID.equals("")) {
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
