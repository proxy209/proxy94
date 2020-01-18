package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class SignCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		UserDAO userDAO = new UserDAO();
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		if (userID.equals("") || userPassword.equals("") || userName.equals("") || userEmail.equals("")) {
			request.setAttribute("Error", "0");
			RequestDispatcher rd = request.getRequestDispatcher("sign.jsp");
			rd.forward(request, response);
		} else if (userDAO.sign(userID, userPassword, userName, userEmail) == -1) {
			request.setAttribute("Error", "-1");
			RequestDispatcher rd = request.getRequestDispatcher("sign.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("Error", "1");
			RequestDispatcher rd = request.getRequestDispatcher("sign.jsp");
			rd.forward(request, response);
		}

	}
}
