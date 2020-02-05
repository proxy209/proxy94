package mvc.command;

import org.json.simple.JSONArray;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import info.army;
import info.armyinfo;



public class info implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		armyinfo info = new armyinfo();
		String k = request.getParameter("kind");
		String a = request.getParameter("age");
		System.out.println(">>>>>>" + k);
		System.out.println(">>>>>>" + a);
		army am = new army();
		ArrayList<armyinfo> list = am.list();
		if(k != "" && a != "") {
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getKind().equals(k)==true ){
			System.out.println(list.get(i).getKind());
			}
		}
		}
		

	}

}
