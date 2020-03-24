package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import like.likeDAO;

public class LikeCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		likeDAO dao = new likeDAO();
	
		String userID = request.getParameter("userID");
		String b = request.getParameter("bID");
		int bID = Integer.parseInt(b);
		
		if (userID.equals("null")) {
			request.setAttribute("Error", "0");
			RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		} else if (dao.like(userID, bID) == -1){
			request.setAttribute("Error", "-1");
			RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		}
		else if (userID != null) {
			dao.like(userID, bID);
			request.setAttribute("Error", "2");
			RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		} 
	}

}
