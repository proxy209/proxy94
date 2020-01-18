<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="widht=divece=width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="View.css">
    
    
    
    <title> View </title>
    
    </head>
    
    <body>
    <%
      String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
    }
    int bbsID=0;
    if(request.getParameter("bbsID") != null){
    	bbsID= Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID == 0){
  	   PrintWriter script = response.getWriter();
  	   script.println("<script>");
  	   script.println("alert('유효하지 않은 글입니다.')");
  	   script.println("location.href = 'board.jsp'");
  	   script.println("</script>");
    }
     Bbs bbs = new BbsDAO().getBbs(bbsID);
     
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
                <h1> View </h1>
             <div class="row">
            
                 <table class="table" style="text-align: center; border=1px solid balck">
                   <thead>
                      <tr>
                          <th colspan="3" style="background-color: grey; text-align: center;">View</th>
                       </tr>
                     </thead>
                     <tbody>
                         <tr>
                         <td style="width:20%" >제목</td>
                         <td colspan="2" ><%= bbs.getBbsTitle() %></td>
                         </tr>
                         
                           <tr>
                         <td>작성자</td>
                         <td colspan="2"><%= bbs.getUserID() %></td>
                         </tr>
                         
                          <tr>
                         <td>작성일자</td>
                         <td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13)+ "시" + bbs.getBbsDate().substring(14,16)+"분" %></td>
                         </tr>
                         
                         <tr>
                         <td>내용</td>
                         <td colspan="3" style="min-height: 200px; text-align:center;"><%= bbs.getBbsContent() %></td>
                         </tr>
                     </tbody>
                     
                 </table>
                 <a href="board.jsp" class="boardbtn1">목록</a>
                 
                 <%
                 if(userID != null && userID.equals(bbs.getUserID())){
                 %>
                	 <a href="update.jsp?bbsID=<%= bbsID%>" class="boardbtn2">수정</a>
                	 <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="boardbtn3">삭제</a>
                <%
                 }
                 %>
              
                </div> 
            </div>
            
            
     
    </body>
</html>