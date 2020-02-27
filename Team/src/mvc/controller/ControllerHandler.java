package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.LogOutCommand;
import mvc.command.LoginCommand;
import mvc.command.RepleCommand;
import mvc.command.SignCommand;
import mvc.command.mailCommand;
import mvc.command.writeCommand;

@WebServlet("*.go")
public class ControllerHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		action(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		action(request, response);
	}

	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		CommandHandler command = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/login.go")) {
			command = new LoginCommand();
			command.process(request, response);
		} else if (com.contentEquals("/logOut.go")) {
			command = new LogOutCommand();
			command.process(request, response);
		} else if (com.contentEquals("/sign.go")) {
			command = new SignCommand();
			command.process(request, response);
		} else if (com.contentEquals("/write.go")) {
			command = new writeCommand();
			command.process(request, response);
		} else if (com.contentEquals("/reple.go")) {
			command = new RepleCommand();
			command.process(request, response);
		} else if (com.contentEquals("/mail.go")) {
			command = new mailCommand();
			command.process(request, response);
		} else if (com.contentEquals("/like.go")) {
			command = new mailCommand();
			command.process(request, response);
	}
	}
}
