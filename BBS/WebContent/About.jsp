<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>



<!doctype html>
<html>
<head>
    <meta charset="utf-8" content="widht=divece=width">
    <title> About </title>
    <link rel="stylesheet" href="Aboutstyle.css">
     <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
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
        <script src="app.js"></script>
        <div class="container">
        <div class="parallax">
            </div>
              <p>The company was started in 1913 by Mario Prada and his brother Martino as a leather goods shop â Fratelli Prada â in Milan, Italy. Initially, the shop sold animal goods and imported English steamer trunks and handbags.

Mario Prada did not believe that women should have a role in business, and so he prevented female family members from entering his company. Ironically, Mario's son harbored no interest in the business, so it was his daughter Luisa Prada who took the helm of Prada as his successor, and ran it for almost twenty years. Her own daughter, Miuccia Prada, joined the company in 1970, eventually taking over for her mother in 1978.

Miuccia began making waterproof backpacks out of Pocone, a nylon fabric.[4] She met Patrizio Bertelli in 1977, an Italian who had begun his own leather goods business at the age of 24, and he joined the company soon after. He advised Miuccia on company business, which she followed. It was his advice to discontinue importing English goods and to change the existing luggage.</p>
                  <p><br>
            </p>
            <p>Prada's originality made it one of the most influential fashion houses,and the brand became a premium status symbol in the 1990s.

Sales were reported at L 70 billion, or US$31.7 million, in 1998.[citation needed] Partrizio di Marco took charge of the growing business in the United States after working for the house in Asia. He was successful in having the Prada bags prominently displayed in department stores, so that they could become a hit with fashion editors. Prada's continued success was attributed to its "working-class" theme which, Ginia Bellafante at The New York Times Magazine proclaimed, "was becoming chic in the high-tech, IPO-driven early 1990s." Furthermore, now husband and wife, Miuccia and Bertelli led the Prada label on a cautious expansion, making products hard to come by.</p>
         <div class="parallax1">
            </div>
                <p>Men's ready-to-wear collections were launched in the mid-1990s. By 1994, sales were at US$210 million, with clothing sales accounting for 20% (expected to double in 1995). Prada won another award from the CFDA, in 1995 as a "designer of the year" 1996 witnessed the opening of the 18,000 ftÂ² Prada boutique in Manhattan, New York, the largest in the chain at the time. By now the House of Prada operated in 40 locations worldwide, 20 of which were in Japan. The company owned eight factories and subcontracted work from 84 other manufacturers in Italy. Miuccia's Prada and Bertelli company were merged to create Prapar B.V. in 1996. The name, however, was later changed to Prada B.V., and Patrizio Bertelli was named Chief Executive Officer of the Prada luxury company.

1996 can also be seen as marking an important turning point in Pradaâs aesthetics, one that fueled the brandâs worldwide reputation. Journalists praised Miucciaâs development of an âugly chicâ style, which initially confused customers by offering blatantly unsexy outfits which then revealed to offer daring and original takes on the relationship between fashion and desire. Since then Prada has been regarded as one of the most intelligent and conceptual designers.</p>
            </div>
           
    </section>
    </body>
</html>