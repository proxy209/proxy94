package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class LoginCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		UserDAO userDAO = new UserDAO();
		

       if(userDAO.login(userID, userPassword) == 1) {
		HttpSession session = request.getSession();
		session.setAttribute("userID", userID);
		response.sendRedirect("main.jsp");
       } else if(userDAO.login(userID, userPassword) == 0) {
    	   request.setAttribute("Error", "0");
    	   RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
    	   rd.forward(request, response);
       } else if(userDAO.login(userID, userPassword) == -1) {
    	   request.setAttribute("Error", "-1");
    	   RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
    	   rd.forward(request, response);
       }
	}
}
