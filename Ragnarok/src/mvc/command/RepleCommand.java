package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reple.RepleDAO;



public class RepleCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		RepleDAO reple = new RepleDAO();
		String bbsID = request.getParameter("bbsID");
		String userID = request.getParameter("userID");
		String repleContent = request.getParameter("repleContent");
		
		System.out.println("bbsID>>>>>"+bbsID);
		System.out.println("userID>>>>>"+userID);
		System.out.println("repleContent>>>>>"+repleContent);
		
		if(userID.equals("null")) {
			 request.setAttribute("Error", "0");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
		} else if(repleContent=="") {
			 request.setAttribute("Error", "1");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
		} else{
			request.setAttribute("Error", "2");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
			reple.reple(bbsID, userID, repleContent);
		}

	}
}
