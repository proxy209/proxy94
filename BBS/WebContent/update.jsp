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
    <link rel="stylesheet" href="write.css">
    
    
    
    <title> board </title>
    
    </head>
    
    <body>
    <%
      String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
    }
   
      
        if(userID == null){
        	PrintWriter script = response.getWriter();
 	  	   script.println("<script>");
 	  	   script.println("alert('로그인을 해주세요.')");
 	  	   script.println("location.href = 'login.html'");
 	  	   script.println("</script>");
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
        	  	   if(!userID.equals(bbs.getUserID())){
        	  		 PrintWriter script = response.getWriter();
          	  	   script.println("<script>");
          	  	   script.println("alert('권한이 없습니다.')");
          	  	   script.println("location.href = 'board.jsp'");
          	  	   script.println("</script>");
        	  	   }
        	  	   
        	   
 
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
     
    
      
            <div class="container">
                <h1> QnA </h1>
             <div class="row">
             <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
                 <table class="table" style="text-align: center; border=1px solid balck">
                   <thead>
                      <tr>
                          <th colspan="2" style="background-color: grey; text-align: center;">게시판 글수정 양식</th>
                       </tr>
                     </thead>
                     <tbody>
                         <tr>
                         <td><input type="text" class="form-control1" placeholder="글 제목" name="bbsTitle" value="<%= bbs.getBbsTitle() %>"> </td>
                         </tr>
                         <td><textarea class="form-control2" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"><%= bbs.getBbsTitle() %></textarea></td>
                        
                     </tbody>
                 </table>
                 <input type="submit" class="writebtn" value="글수정">
                 </form>
                </div> 
            </div>
            
           
    </body>
</html>