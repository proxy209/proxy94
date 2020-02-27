package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.bbsDAO;

public class writeCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String bTitle = request.getParameter("bTitle");
		String userID = request.getParameter("userID");
		String bContent = request.getParameter("bContent");
		bbsDAO bbsDAO = new bbsDAO();
		bbsDAO.write(bTitle, userID, bContent);

       if(bTitle.equals("") || bContent.equals("") || userID.equals("")) {
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
