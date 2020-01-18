<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
   
    <title> login </title>
    </head>
    
    <body> 
    <%
       String userID=null;
       if(session.getAttribute("userID") != null){
    	   userID = (String) session.getAttribute("userID");
       }
       if(userID == null){
    	   PrintWriter script = response.getWriter();
    	   script.println("<script>");
    	   script.println("alert('로그인을 해주세요.')");
    	   script.println("location.href = 'login.html'");
    	   script.println("</script>");
       } else if(userID != null){
    	   PrintWriter script = response.getWriter();
    	   script.println("<script>");
    	   script.println("location.href = 'write.jsp'");
    	   script.println("</script>");
       }
    %>
       
    
    </body>
    
    
</html>