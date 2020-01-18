<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="widht=divece=width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
    
    
    
    <title> BOURGEOIS </title>
    
    </head>
    
    <body>
    <%
      String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
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
    
     
        <section>
          <header>
             <div class="main">
                 <div id="Btn">
                 <i class="fas fa-angle-left" id="prevBtn"></i>
                 <i class="fas fa-angle-right" id="nextBtn"></i>
                    </div>
                 
                <div class="main-slide">
              <img src="img.jpg" id="lastClone" alt="">
                <h1>NEW BOURGEOIS</h1>
              <img src="img2.jpg" alt="">
                <h2>BOURGEOIS<br>새로운 컬렉션</h2>
              <img src="img3.jpg" alt="">
                <h3>'경험'하세요</h3>
              <img src="img4.jpg" id="firstClone" alt="">
                 <h4>Plan your life</h4>
             </div>
              </div>
            </header>
        </section>
        
        <script src="app.js"></script>
    </body>
</html>