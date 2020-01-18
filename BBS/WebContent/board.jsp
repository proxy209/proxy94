<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="widht=divece=width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="boardstyle.css">
    
    
    
    <title> board </title>
    
    </head>
    
    <body>
    <%
     String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1;
    if(request.getParameter("pageNumber") != null){
    	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
     %>
      
         <% 
           if(userID == null){    
         %>
        <header>
         <nav>
        <div class="logo">
         <h4> BOURGEOIS</h4>
         </div>
         
         <ul class="nav-links">
             <li><a href="main.jsp">Home</a></li>
             <li><a href="About.jsp">About</a></li>
             <li><a href="#">Shop</a></li>
             <li><a href="board.jsp">QnA</a></li>
             <li><a href="login.html">Log In</a></li>
         </ul>
             
         <div class="burger">
             <div class="line1"></div>
             <div class="line2"></div>
             <div class="line3"></div>
           </div>
            </nav>
             </header>
        <%
           } else {   
        %>
         <header>
         <nav>
        <div class="logo">
         <h4> BOURGEOIS</h4>
         </div>
         
        <ul class="nav-links">
             <li><a href="main.jsp">Home</a></li>
             <li><a href="About.jsp">About</a></li>
             <li><a href="#">Shop</a></li>
             <li><a href="board.jsp">QnA</a></li>
             <li><a href="logoutAction.jsp">Log Out</a></li>
         </ul>
             
         <div class="burger">
             <div class="line1"></div>
             <div class="line2"></div>
             <div class="line3"></div>
           </div>
            </nav>
             </header>
        <%
           }
        %>
      
    
      
            <div class="container">
                <h1> QnA </h1>
             <div class="row">
                 <table class="table" style="text-align: center; border=1px solid balck">
                   <thead>
                      <tr>
                          <th style="background-color: grey; text-align: center;">번호</th>
                          <th style="background-color: grey; text-align: center;">제목</th>
                          <th style="background-color: grey; text-align: center;">작성자</th>
                          <th style="background-color: grey; text-align: center;">작성일</th>
                       </tr>
                     </thead>
                     <tbody>
                     <%
                       BbsDAO bbsDAO = new BbsDAO();
                       ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                       for(int i=0; i < list.size(); i++){
                     %>
                     <tr>
                         <td><%= list.get(i).getBbsID() %></td>
                         <td><a href="View.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
                         <td><%= list.get(i).getUserID() %></td>
                         <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13)+ "시" + list.get(i).getBbsDate().substring(14,16)+"분" %></td>
                         </tr>
                         <%
                       }
                         %>
                     </tbody>
                    
                 </table>
                 <%
                 if(pageNumber != 1){
                	 %>
                	 <a href="board.jsp?pageNumber=<%=pageNumber -1%>" class="pagebtn1"> Prev </a>
                 <%
                 } if(bbsDAO.nextPage(pageNumber + 1)){
                	 %>
                	 <a href="board.jsp?pageNumber=<%=pageNumber +1%>" class="pagebtn2"> Next </a>
       
                <%
                 }
                 %>
                 <form method="post" action="boardAction.jsp">
                 <input type="submit" class="writebtn" value="글쓰기">
                 </form>
                </div> 
            </div>
            
            
     
    </body>
</html>