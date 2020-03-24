package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reple.repleDAO;



public class RepleCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		repleDAO reple = new repleDAO();
		String bID = request.getParameter("bID");
		String userID = request.getParameter("userID");
		String rContent = request.getParameter("rContent");
		
		System.out.println("bbsID>>>>>"+bID);
		System.out.println("userID>>>>>"+userID);
		System.out.println("repleContent>>>>>"+rContent);
		
		if(userID.equals("null")) {
			 request.setAttribute("Error", "0");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
		} else if(rContent=="") {
			 request.setAttribute("Error", "1");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
		} else{
			request.setAttribute("Error", "2");
	    	 RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
	    	 rd.forward(request, response);
			 reple.reple(bID, userID, rContent);
		}

	}
}
